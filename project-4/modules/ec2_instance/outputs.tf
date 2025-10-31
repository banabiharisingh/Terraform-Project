output "instance_ids" {
  description = "IDs of the EC2 instances"
  value       = aws_instance.web.id
}

output "public_ips" {
  description = "Public IPs of the EC2 instances"
  value       = aws_instance.web.associate_public_ip_address
}

output "public_ip" {
  description = "Public IPs of the EC2 instances"
  value       = aws_instance.web.public_ip
}