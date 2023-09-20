output "jenkins_public_ip" {
  description = "Public IP address of the EC2 instance with Jenkins Master"
  value       = aws_instance.jenkins_instance.public_ip
}

output "jenkins_private_ip" {
  description = "Public IP address of the EC2 instance with Jenkins Master"
  value       = aws_instance.jenkins_instance.private_ip
}

output "ansible_private_ip" {
  description = "Public IP address of the EC2 instance with Jenkins Master"
  value       = aws_instance.ansible_instance.private_ip
}

output "vpc_id" {
    description = "Main VPC ID of the Project"
    value = aws_vpc.main_vpc.id
}

output "public_subnet_1_id" {
    description = "Public Subnet 1 ID"
    value = aws_subnet.public_subnets[0].id
}

output "public_subnet_2_id" {
    description = "Public Subnet 2 ID"
    value = aws_subnet.public_subnets[1].id
}

output "public_subnet_3_id" {
    description = "Public Subnet 3 ID"
    value = aws_subnet.public_subnets[2].id
}

output "private_subnet_1_id" {
    description = "Public Subnet 1 ID"
    value = aws_subnet.private_subnets[0].id
}

output "private_subnet_2_id" {
    description = "Public Subnet 1 ID"
    value = aws_subnet.private_subnets[1].id
}

output "database_subnet_1_id" {
    description = "Public Subnet 1 ID"
    value = aws_subnet.database_subnets[0].id
}

output "database_subnet_2_id" {
    description = "Public Subnet 1 ID"
    value = aws_subnet.database_subnets[1].id
}
