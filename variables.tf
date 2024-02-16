variable "region" {
  type        = string
  default     = "eu-west-1"
  description = "The AWS region where resources will be created."
}

variable "ami_id" {
  type        = string
  default     = "ami-0aef57767f5404a3c"
  description = "The AMI ID for the EC2 instance."
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The type of EC2 instance to be launched."
}

variable "availability_zones" {
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b"]
  description = "A list of availability zones in the specified region."
}

