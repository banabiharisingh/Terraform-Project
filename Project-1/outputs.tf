output "instance_ids" {
  value = [for instance in aws_instance.ec2 : instance.id]
}

output "public_ips" {
  value = [for instance in aws_instance.ec2 : instance.public_ip]
}