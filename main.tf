provider "aws" {
    profile = "ttn-newers"
    region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  
  availability_zone_private        = ["us-east-1a", "us-east-1b"]
  availability_zone_public = ["us-east-1c", "us-east-1d"]
  private_subnet = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnet =  ["10.0.3.0/24","10.0.4.0/24"]
#   enable_nat_gateway = true
#   enable_vpn_gateway = true
}

#module "iam" {
#  source = "./modules/iam"
#}

