# Use the existing security group in your resources (e.g., EC2 instance)
  resource "aws_instance" "expense" {
    ami    = data.aws_ami.joindevops.id
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id] # Use the security group ID from the data source
    # tags = {
    # Name = var.instance_names[count.index]
    # }
    tags = {
      Name = "terraform"
    }
} 
  resource "aws_security_group" "allow_ssh_terraform" {
    name   = "allow_sshh"
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
      Name = "allow_sshh"
    }
  
}