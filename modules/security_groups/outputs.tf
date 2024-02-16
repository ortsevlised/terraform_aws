output "security_group_id" {
  description = "The ID the Security Group"
  value       = aws_security_group.web_and_ssh.id
}