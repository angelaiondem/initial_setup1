# Create a VPC
resource "aws_vpc" "project_vpc" {
  cidr_block = var.vpc_cidr
  tags       = { Name = "Project_main_VPC" }
}

# Create a public subnet within the VPC
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.project_vpc.id
  cidr_block              = var.jenkins_server_public_cidr
  map_public_ip_on_launch = true
}

# Create a security group for the EC2 instance
resource "aws_security_group" "jnkins_security_group" {
  name        = "jenkins-security-group"
  description = "Jenkins Security Group for EC2"
  vpc_id      = aws_vpc.project_vpc.id

  ingress {
    description = "Allow SSH from Personal CIDR block."
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Is not the best practice to open for everyone
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Launch a public EC2 instance with Jenkins
resource "aws_instance" "jenkins_instance" {
  ami                    = data.aws_ami.latest_ubuntu20.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.jnkins_security_group.id]
  key_name               = "jenkins_key"
  user_data              = file("user_data_jenkins.sh")
  tags = {
    Name = "Jenkins_Server"
  }
}

# Create a key pair, public key
resource "aws_key_pair" "jenkins_key" {
  key_name   = "jenkins_key"
  public_key = tls_private_key.rsa.public_key_openssh
} 

# Create RSA key pair of size 4096 bits
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create privat key in local machin
resource "local_file" "jenkins_key_private" {
  content         = tls_private_key.rsa.private_key_pem
  filename        = pathexpand("~/.ssh/jenkins_key.pem")
  file_permission = "400"

}
