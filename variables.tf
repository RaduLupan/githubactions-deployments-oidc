variable "aws_region" {
  description = "The AWS region to deploy the resources in."
  type        = string
  default     = "us-east-1"
}

variable "ec2_ami_id" {
  description = "The AMI ID to use for the EC2 instance. If null, the latest Canonical Ubuntu AMI will be used."
  type        = string
  default     = null

}