# #ec2 instance configuration
# resource "aws_instance" "terraform" {
#   ami           = "ami-09c813fb71547fc4f"
#   instance_type = "t3.micro"

#     # security group referencep 
#   vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
#   tags = {
#      Name = "terraform"
#   }
# }

# security group configuration
resource "aws_security_group" "allow_ssh_terraform" {
  name        = "allow_sshh"
  description = "Allow port number 22 for SSH access"

  # Egress - allow all outgoing traffic
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # Ingress - allow incoming traffic on port 22 (SSH)
  dynamic "ingress" {
    for_each = var.ingress_rules
    from_port        = ingress.values["from_port"]
    to_port          = ingress.values["to_port"]
    protocol         = ingress.values["portocol"]
    cidr_blocks      = ["0.0.0.0/0"] # Allow from everywhere
    ipv6_cidr_blocks = ["::/0"]
  }

  

  tags = {
     Name = "allow_sshh"
  }
}


