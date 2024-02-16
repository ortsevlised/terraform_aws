variable "name" {
  description = "Name tag for the security group"
  type        = string
}

variable vpc_id {
  description = "The ID of the VPC"
  type        = string
}

variable "description" {
  description = "Description for the security group"
  type        = string
}

variable "ingress_rules" {
  type = list(object({
    cidr_blocks = list(string)
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
  }))
}

variable "egress_rules" {
  type = list(object({
    cidr_blocks = list(string)
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
  }))
}
