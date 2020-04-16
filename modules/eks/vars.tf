variable "aws_eks_cluster_name" {
  default = "EKS_cluster"
}
variable "node_group_name" {
  default = "EKS_node_group"
}
variable "role_arn" {
  default = ""
}
variable "subnet_ids"{
  default = null
}

variable "node_role_arn" {
  default = null
}
