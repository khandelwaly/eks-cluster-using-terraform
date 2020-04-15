variable "name" {
  type = string
  default =""
}

variable "cidr_block" {
    default = null
}

variable "private_subnet" {
  default = [""]
}

variable "availability_zone" {
  default = [""]
}

variable "tag" {
  type    = map
  default = {
    "Name" = "eks-vpc-devops"
    "owner" = "eks-vpc-devops"
    "purpose" = "tf-2"
  }
}