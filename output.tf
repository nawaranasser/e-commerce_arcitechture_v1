output "dns_name" {
  value = aws_lb.e-commerce-alb.dns_name
}

output "bastion_public_ip"{
  value = aws_instance.bastion_host.public_ip
}

output "machine1_private_ip" {
  value = aws_instance.e-commerce_instance-1.private_ip
}


output "machine2_private_ip" {
  value = aws_instance.e-commerce_instance-2.private_ip
}

