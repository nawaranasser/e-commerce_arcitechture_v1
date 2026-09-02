resource "aws_security_group" "alb-sg" {
  name        = "alb-sg"
  description = "Allow http from anywhere"
  vpc_id      = aws_vpc.e-commerce_vpc.id
  
  tags = {
    Name = "alb-sg"
  }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
        }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
}


# 1. Fetch your current public IP address dynamically
data "http" "my_ip" {
  url = "https://ifconfig.me/ip"
}


resource "aws_security_group" "bastion-sg" {
  name        = "bastion-sg"
  description = "Allow ssh from MyIP"
  vpc_id      = aws_vpc.e-commerce_vpc.id
  
  tags = {
    Name = "bastion-sg"
  }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["${chomp(data.http.my_ip.response_body)}/32"]
        }


    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
 
}




resource "aws_security_group" "ec2-sg" {
  name        = "ec2-sg"
  description = "Allow http from alb-sg"
  vpc_id      = aws_vpc.e-commerce_vpc.id
  
  tags = {
    Name = "ec2-sg"
  }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        security_groups = [aws_security_group.alb-sg.id]
        }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        security_groups = [aws_security_group.bastion-sg.id]
    }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
    # depends_on = [ aws_security_group.alb-sg , aws_security_group.bastion-sg]
}
