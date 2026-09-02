resource "aws_route_table" "public-RT" {
  vpc_id = aws_vpc.e-commerce_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.e-commerce_igw.id
  }

  tags = {
    Name = "public-RT"
  }
}

resource "aws_route_table" "private-RT" {
  vpc_id = aws_vpc.e-commerce_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.e-commerce_nat_gw.id
  }

  tags = {
    Name = "private-RT"
  }
}

resource "aws_route_table_association" "public-subnet-1-association" {
  subnet_id      = aws_subnet.public_subnet-1.id
  route_table_id = aws_route_table.public-RT.id
} 

resource "aws_route_table_association" "public-subnet-2-association" {
  subnet_id      = aws_subnet.public_subnet-2.id
  route_table_id = aws_route_table.public-RT.id
} 


resource "aws_route_table_association" "private-subnet-1-association" {
  subnet_id      = aws_subnet.private_subnet-1.id
  route_table_id = aws_route_table.private-RT.id
} 

resource "aws_route_table_association" "private-subnet-2-association" {
  subnet_id      = aws_subnet.private_subnet-2.id
  route_table_id = aws_route_table.private-RT.id
} 
