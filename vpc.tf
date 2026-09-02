# Create a VPC
resource "aws_vpc" "e-commerce_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "e-commerce-vpc"
  }
}