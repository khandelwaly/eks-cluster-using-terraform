variable "name" {
  type = map
  default = {
      cluster = "eks-cluster"
      node = "eks-node"
  }
}
