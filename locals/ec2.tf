resource "aws_instance" "terraform" {
  count         = length(var.instance_name)
  ami           = data.aws_ami.ami_info.id
  instance_type = var.instance_name[count.index] == "mysql" ? "t3.small" : "t3.micro"

  # Use the security group ID from the data source
  vpc_security_group_ids = [aws_security_group.allow_sshh_terraform.id]

  tags = {
    Name = var.instance_name[count.index]
  }
}
resource "aws_security_group" "allow_sshh_terraform" {
  name        = "allow_sshh_raidi"
  description = "Allow port number 22 for SSH access"


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # Ingress - allow incoming traffic on port 22 (SSH)
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # Allow from everywhere
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_sshh_raidi"
  }

}
