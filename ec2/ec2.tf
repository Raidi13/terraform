#ec2 instance configuration
resource "aws_instance" "terraform" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"

    # security group referencep 
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
  tags = {
     Name = "terraform"
  }
}

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

  # terraform will give us a variable with block name

   dynamic "ingress" {
    for_each = var.ingress_rules
    content {
    from_port        = ingress.value["from_port"] 
    to_port          = ingress.value["to_port"]
    protocol         = ingress.value["protocol"]
    cidr_blocks      = ingress.value["cidr_blocks"] # Allow from everywhere
    }
  }
tags = {
     Name = "allow_sshh"
  }
}


