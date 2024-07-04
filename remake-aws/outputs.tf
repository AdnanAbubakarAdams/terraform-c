output "instance_id" {
  description = ""
  value       = aws_instance.terPrac.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.terPrac.public_ip
}
