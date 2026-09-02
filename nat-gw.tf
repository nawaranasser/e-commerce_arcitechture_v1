resource "aws_nat_gateway" "e-commerce_nat_gw" {
  vpc_id            = aws_vpc.e-commerce_vpc.id
  availability_mode = "regional"
  tags = {
    Name = "e-commerce-nat-gw"
  }
}