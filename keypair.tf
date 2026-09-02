# 1. Generate a TLS private key
resource "tls_private_key" "rsa_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
# private key that genrated by tls_private_key stored in unencrypted way in Terraform state file
# this times in test env only 


# 2. Register the public key with AWS
resource "aws_key_pair" "deployer" {
  key_name   = "dynamic-deployer-key"
  public_key = tls_private_key.rsa_key.public_key_openssh
}

# 3. Save the private key locally to log into your EC2 instance
resource "local_file" "private_key" {
  content         = tls_private_key.rsa_key.private_key_pem
  filename        = "${path.module}/deployer-key.pem"
  file_permission = "0400"
}
