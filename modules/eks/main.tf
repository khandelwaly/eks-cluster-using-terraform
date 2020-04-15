resource "aws_eks_cluster" "self" {
  name     = vars.aws_eks_cluster_name
  role_arn = cluster_role.name

  vpc_config {
    subnet_ids = ["${aws_subnet.example1.id}", "${aws_subnet.example2.id}"]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    "aws_iam_role_policy_attachment.example-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.example-AmazonEKSServicePolicy",
  ]
}

output "endpoint" {
  value = "${aws_eks_cluster.example.endpoint}"
}

output "kubeconfig-certificate-authority-data" {
  value = "${aws_eks_cluster.example.certificate_authority.0.data}"
}


resource "aws_eks_node_group" "self" {
  cluster_name    = aws_eks_cluster.self.name
  node_group_name = vars.node_group_name
  node_role_arn   = aws_iam_role.cluster_role.arn
  subnet_ids      = aws_subnet.example[*].id

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
  ]
}