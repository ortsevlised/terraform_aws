variable "region" {
  type        = string
  default     = "eu-west-1"
  description = "The AWS region where resources will be created."
}

variable "availability_zones" {
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b"]
  description = "A list of availability zones in the specified region."
}

variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "The CIDR block for the VPC."
}

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "A list of CIDR blocks for the public subnets."
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
  description = "A list of CIDR blocks for the private subnets."
}

variable "instance_ami" {
  type        = string
  default     = "ami-0aef57767f5404a3c"
  description = "The AMI ID for the EC2 instance."
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The type of EC2 instance to be launched."
}
