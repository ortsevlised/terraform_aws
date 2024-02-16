resource "aws_security_group" "web_and_ssh" {
  name        = var.name
  vpc_id      = var.vpc_id
  description = var.description

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      cidr_blocks = egress.value.cidr_blocks
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
    }
  }
}