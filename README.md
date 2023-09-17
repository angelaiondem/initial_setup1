# initial_setup1
### Create a VPC and EC2
This terraform code creates a VPC with 2 public sibnetes with internet gateway, 2 private subnets with NAT gateway, and database subnetes.\
Also creates one EC2 instance with the already installed Jenkins master in public subnet.

After creating the infrastructure, the code outputs the public and the private IPs of the instance, cidr block of the VPC and the VPC ID:

e.g.\
instance_private_ip = "10.100.1.63"\
instance_public_ip = "18.157.177.109"\
vpc_cidr_block = "10.100.0.0/16"\
vpc_id = "vpc-029dad308c9f853b0" 
