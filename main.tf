terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.56.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-1"
  profile = "default"
}

module "new-vpc-terraform" {
  source                    = "./modules/new-vpc-terraform"
  # region                    = 
  # vpc-cidr                  = "${var.vpc-cidr}"
  # public-subnet-1-cidr      = "${var.public-subnet-1-cidr}"
  # public-subnet-2-cidr      = "${var.public-subnet-2-cidr}"
  # private-subnet-1-cidr     = "${var.private-subnet-1-cidr}"
  # private-subnet-2-cidr     = "${var.private-subnet-2-cidr}"
  # private-subnet-3-cidr     = "${var.private-subnet-3-cidr}"
  # private-subnet-4-cidr     = "${var.private-subnet-4-cidr}"
}

module "ec2-demo" {
    source                    = "./modules/ec2-demo"
    # ami_id                    = "${var.ami_id}"
    # instance_type             = "${var.instance_type}"
    vpc_id                    =  module.new-vpc-terraform.vpc_id
    # name                      = "${var.name}-sg"
    # tags                      = "${var.tags}"
    subnet_id                 = module.new-vpc-terraform.public_subnet_id_1
    # depends_on = [
    #   module.new-vpc-terraform.vpc
    # ]

}

module "rds" {
  source                        = "./modules/rds"
  # instance_class                = 
  # storage                       =
  # engine                        = 
  # engine-version                =  
}
# module "vpc" {
#   source = "./modules/new-vpc-terraform"
# }

# module "ec2" {
#   source = "./modules/ec2-demo"
# }

# module "rds" {
#   source = "./modules/rds"
# }