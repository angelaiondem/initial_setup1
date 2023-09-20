# initial_setup1
### Create a VPC and two EC2s
This terraform code creates a VPC with 3 public sibnetes with internet gateway, 2 private subnets with NAT gateway, and database subnetes.\
Also creates one EC2 instance with the already installed Jenkins master in public subnet and one EC2 with already installed Ansible Master in a private subnet.

After creating the infrastructure, the code outputs the following data:

e.g.\
Outputs:

ansible_private_ip = "10.100.101.109"
database_subnet_1_id = "subnet-0dcf55b9c0e2b1610"
database_subnet_2_id = "subnet-09f13ca70399fc59e"
jenkins_private_ip = "10.100.1.252"
jenkins_public_ip = "3.120.210.127"
private_subnet_1_id = "subnet-0bce954dbdb0c32bf"
private_subnet_2_id = "subnet-00e924fbacdbb9179"
public_subnet_1_id = "subnet-020ee954f855615e1"
public_subnet_2_id = "subnet-05656f14c922bfbb0"
public_subnet_3_id = "subnet-0301ad11271320512"
vpc_id = "vpc-0a586e5b5708fff72"
