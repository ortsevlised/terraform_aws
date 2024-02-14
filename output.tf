output "public_dns" {
  value = "http://${aws_instance.test_server.public_dns}:8080"
}