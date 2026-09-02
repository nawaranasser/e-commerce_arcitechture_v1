resource "aws_instance" "e-commerce_instance-1" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.private_subnet-1.id
  vpc_security_group_ids = [aws_security_group.ec2-sg.id]
  # user_data = file("./userdata.sh")
  key_name      = aws_key_pair.deployer.key_name
  tags = {
    Name = "e-commerce-instance-1"
  }
  
}

resource "aws_instance" "e-commerce_instance-2" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.private_subnet-2.id
  vpc_security_group_ids = [aws_security_group.ec2-sg.id]
  # user_data = file("./userdata.sh")
  key_name      = aws_key_pair.deployer.key_name
  tags = {
    Name = "e-commerce-instance-2"
  }
}

resource "aws_instance" "bastion_host" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.public_subnet-1.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.bastion-sg.id]
  key_name      = aws_key_pair.deployer.key_name
  tags = {
    Name = "bastion-host"
  }
}
