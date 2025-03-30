provider "aws" {
  region = var.aws_region
}

locals {
  ami_id = var.ec2_ami_id != null ? var.ec2_ami_id : data.aws_ami.example.id
}

data "aws_ami" "example" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "example" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  tags = {
    Name = "GitHubActionsEC2Example"
    change = "Prod1" 
  }
}