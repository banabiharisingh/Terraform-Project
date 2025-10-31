variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "name" {
  description = "Name tag for the instance"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}

variable "subnet_id" {
  description = "Subnet ID for the instance"
  type        = string
}


variable "key_name" {
  description = "SSH key name"
  type        = string
}

variable "private_key_path" {
  description = "Path to the private key file for SSH"
  type        = string
}

variable "ssh_user" {
  description = "SSH username for EC2 instance"
  type        = string
  default     = "ubuntu"
}

variable "index_file_path" {
  description = "Path to the custom index.html file"
  type        = string
}

variable "index_file_destination" {
  description = "Destination path on EC2 for index.html"
  type        = string
  default     = "/tmp/index.html"
}

variable "nginx_install_commands" {
  description = "Commands to install and start Nginx"
  type        = list(string)
  default     = [
    "sudo apt update -y",
    "sudo apt install nginx -y",
    "sudo systemctl start nginx",
    "sudo systemctl enable nginx"
  ]
}

variable "nginx_post_copy_commands" {
  description = "Commands to move index.html and restart Nginx"
  type        = list(string)
  default     = [
    "sudo mv /tmp/index.html /var/www/html/index.html",
    "sudo systemctl restart nginx"
  ]
}

variable "ingress_rules" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created"
  type        = string
}
