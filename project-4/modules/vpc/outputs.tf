output "vpc_id" {
  value       = aws_vpc.this.id
  description = "VPC ID"
}

output "public_subnet_id" {
  value       = aws_subnet.public.id
  description = "Public subnet ID"
}

output "public_subnet_az" {
  value       = aws_subnet.public.availability_zone
  description = "Availability Zone of the public subnet"
}

output "public_route_table_id" {
  value       = aws_route_table.public.id
  description = "Public route table ID"
}

output "internet_gateway_id" {
  value = aws_internet_gateway.this.id
  
}
