output "public_subnet" {
  description = "The ID the first Public Subnet "
  value       = aws_subnet.subnets["public_subnet_1"].id
}