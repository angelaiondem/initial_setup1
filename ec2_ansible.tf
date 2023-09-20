# Launch a public EC2 instance on t2.micro and installed Ansible Master
resource "aws_instance" "ansible_instance" {
  ami                    = "ami-0ab1a82de7ca5889c"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_subnets[0].id
  vpc_security_group_ids = [aws_security_group.ansible_master_security_group.id]
  key_name               = "devops-project-ansible-master-key"
  tags                   = { Name = "Ansible Master" }
  user_data              = <<-EOF
                            #!/bin/bash # Install Ansible
                            sudo apt-get update
                            sudo apt-get install -y ansible
                            EOF
}

# Security group for Ansible Master
resource "aws_security_group" "ansible_master_security_group" {
  name        = "ansible-master-security-group"
  description = "Ansible Master Security Group"
  vpc_id      = aws_vpc.main_vpc.id
  tags        = {Name = "Ansible Master Security Group"}

  ingress {
    description = "Allow SSH from the local network."
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.100.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}