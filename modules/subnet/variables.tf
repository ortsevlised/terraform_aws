variable "subnets" {
  type = map(object({
    availability_zone = string
    cidr_block        = string
    type              = string
  }))
  default = {
    public_subnet_1 = {
      availability_zone = "eu-west-1a"
      cidr_block        = "10.0.1.0/24"
      type              = "public"
    }
    public_subnet_2 = {
      availability_zone = "eu-west-1b"
      cidr_block        = "10.0.2.0/24"
      type              = "public"
    }
    private_subnet_1 = {
      availability_zone = "eu-west-1a"
      cidr_block        = "10.0.3.0/24"
      type              = "private"
    }
    private_subnet_2 = {
      availability_zone = "eu-west-1b"
      cidr_block        = "10.0.4.0/24"
      type              = "private"
    }
  }
}

variable vpc_id {
  description = "The ID of the VPC"
  type        = string
}

variable internet_gw {
  description = "The ID of the VPC"
  type        = string
}
