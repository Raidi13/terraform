#ec2 instance configuration 
resource "aws_instance" "terraform" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"

  # security group reference
  vpc_security_group_ids = [aws_security_group.allow_sshh_terraform.id]
  
  tags = {
     Name = "terraform"
  }
  provisioner "local-exec"{
    command = "echo ${self.private_ip} > public_ip.txt"
  }

 connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }
  #   #Provision will execute at the time of creation
  # provisioner "remote-exec" {
  #     when = destroy
  #     inline = [
  #     "sudo systemctl stop nginx",
  #   ]
  # }
}

# security group configuration
resource "aws_security_group" "allow_sshh_terraform" {
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
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # Allow from everywhere
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
     Name = "allow_sshh_raidi"
  }
}

