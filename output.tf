output "public_dns" {
  value = "http://${aws_instance.nginx.public_dns}"
}