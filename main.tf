provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-08b5b3a93ed654d19"  # An example Amazon Linux 2 AMI for us-east-1
  instance_type = "t3.medium"
  tags = {
    Name = "GitHubActionsEC2Example"
  }
}