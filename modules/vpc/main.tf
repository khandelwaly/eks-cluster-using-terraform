resource "aws_vpc" "eks-vpc" {
    cidr_block = var.cidr_block
    enable_dns_support   = true
    enable_dns_hostnames = true
    tags = {
          Name = var.tag["Name"]
          owner = var.tag["owner"]
          purpose = var.tag["purpose"]
      }
}

resource "aws_subnet" "private" {
  count                   = length(var.private_subnet)
  vpc_id                  = aws_vpc.eks-vpc.id
  cidr_block              = var.private_subnet[count.index]
  availability_zone       = var.availability_zone[count.index]
  map_public_ip_on_launch = false
}

