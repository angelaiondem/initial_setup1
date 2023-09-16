variable "region" {
    default = "eu-central-1"  # Frankfurt
}

variable "vpc_cidr" {
    default = "10.100.0.0/16"
}

variable "jenkins_server_public_cidr" {
    default = "10.100.1.0/24"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "ami_owners" {
    default = "099720109477"
}

variable "most_recent" {
    default = true
    type = bool
}

variable "ami_values" {
    default = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
}



