provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0b6d6dacf350ebc82"  # An example Amazon Linux 2 AMI for us-east-1
  instance_type = "t3.micro"
  tags = {
    Name = "GitHubActionsEC2Example"
  }
}