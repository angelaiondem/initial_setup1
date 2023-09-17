output "vpc_id" {
    description = "VPC ID"
    value = aws_vpc.main_vpc.id
}

output "vpc_cidr_block" {
    description = "VPC CIDR Block"
    value = aws_vpc.main_vpc.cidr_block
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.jenkins_instance.public_ip
}

output "instance_private_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.jenkins_instance.private_ip
}