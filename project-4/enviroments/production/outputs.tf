output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = module.vpc.public_subnet_id
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = module.vpc.internet_gateway_id
}

output "route_table_id" {
  description = "ID of the public route table"
  value       = module.vpc.public_route_table_id
}

output "instance_id" {
  value = module.ec2_instance.instance_ids
}

output "public_ip" {
  value = module.ec2_instance.public_ips
}



