resource "aws_internet_gateway" "e-commerce_igw" {
  vpc_id = aws_vpc.e-commerce_vpc.id

  tags = {
    Name = "e-commerce-igw"
  }
}