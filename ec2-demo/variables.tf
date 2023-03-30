variable "ami_id" {
  type = string
  default = "ami-014d05e6b24240371"
  description = "AMI ID to deploy EC2 instance"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "Type of instance to deploy" 
}

variable "vpc_id" {
  type = string
  description = "Create instance using this VPC"
}

variable "name"{
  type = string
  default = "ec2-sabin"
  description = "Name of Instance"
}

variable "tags"{
  type = map(string)
  default = {}
  description = "A map of tags to add all resources"
}

variable "subnet_id"{
  type = string
  # default = "subnet-0594c8e05ae315a70"
  description = "Subnet ID"
}