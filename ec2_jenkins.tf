# Launch a public EC2 instance with Jenkins
resource "aws_instance" "jenkins_instance" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnets[0].id
  vpc_security_group_ids = [aws_security_group.jnkins_security_group.id]
  key_name               = var.jenkins_key
  tags = {
    Name = "Jenkins_Master"
  }
}

# Create a security group for the EC2 instance
resource "aws_security_group" "jnkins_security_group" {
  name        = "jenkins-security-group"
  description = "Jenkins Security Group for EC2"
  vpc_id      = aws_vpc.main_vpc.id

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

  tags = merge(var.tags, {Name = "${var.project_name}-SG-for-jenkins"})
}
