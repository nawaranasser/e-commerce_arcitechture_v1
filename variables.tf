variable "region" {
  default = "us-east-1"
  type    = string
  description = "The AWS region to deploy resources in"
}

variable "profile" {
  default = "terrafrom-2"
  type    = string
  description = "The AWS profile to use for authentication"
}

variable "ami_id" {
  default = "ami-0bdc7d025135d7b49"
  type    = string
  description = "The ID of the AMI to use for the EC2 instance"
}

variable "instance_type" {
  default = "t3.micro"
  type    = string
  description = "The instance type for the EC2 instance"
}