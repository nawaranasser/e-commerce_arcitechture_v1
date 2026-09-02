resource "aws_subnet" "public_subnet-1" {
  vpc_id     = aws_vpc.e-commerce_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "public_subnet-2" {
  vpc_id     = aws_vpc.e-commerce_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "${var.region}b"  
  tags = {
    Name = "public-subnet-2"
  }
}

resource "aws_subnet" "private_subnet-1" {
  vpc_id     = aws_vpc.e-commerce_vpc.id
  cidr_block = "10.0.3.0/24"
    availability_zone = "${var.region}a"
  tags = {
    Name = "private-subnet-1"
  }
}

resource "aws_subnet" "private_subnet-2" {
  vpc_id     = aws_vpc.e-commerce_vpc.id
  cidr_block = "10.0.4.0/24"
    availability_zone = "${var.region}b"
  tags = {
    Name = "private-subnet-2"
  }
}
