variable "name" {
  type        = string
  description = "Name prefix for resources"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for the public subnet"
}

variable "availability_zone" {
  type        = string
  description = "Availability zone for subnet"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "key_name" {
  type        = string
  description = "SSH key name"
}

variable "private_key_path" {
  type        = string
  description = "Path to private key file"
}

variable "ssh_user" {
  type        = string
  description = "SSH username"
  default     = "ubuntu"
}

variable "index_file_path" {
  type        = string
  description = "Path to index.html file"
}

variable "index_file_destination" {
  type        = string
  description = "Destination path on EC2"
  default     = "/tmp/index.html"
}

variable "nginx_install_commands" {
  type        = list(string)
  description = "Commands to install Nginx"
  default     = [
    "sudo apt update -y",
    "sudo apt install nginx -y",
    "sudo systemctl start nginx",
    "sudo systemctl enable nginx"
  ]
}

variable "nginx_post_copy_commands" {
  type        = list(string)
  description = "Commands to move index.html and restart Nginx"
  default     = [
    "sudo mv /tmp/index.html /var/www/html/index.html",
    "sudo systemctl restart nginx"
  ]
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "project" {
  description = "Project name for tagging"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., staging, production)"
  type        = string
}

variable "owner" {
  description = "Owner of the infrastructure"
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress rules for the security group"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}