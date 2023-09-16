# Get latest Ubuntu 20.04 version AMI
data "aws_ami" "latest_ubuntu20" {
    owners = [var.ami_owners]
    most_recent = var.most_recent
    filter {
        name = "name"
        values = [var.ami_values]
    }
}