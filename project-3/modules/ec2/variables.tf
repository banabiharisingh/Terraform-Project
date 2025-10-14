variable "vpc_id" {
  description = "VPC ID where EC2 instances will be deployed"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for EC2 instances"
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances to launch"
  type        = number
}

variable "environment" {
  description = "Environment name (staging or production)"
  type        = string
}

variable "tags" {
  description = "Tags to apply to EC2 instances"
  type        = map(string)
}