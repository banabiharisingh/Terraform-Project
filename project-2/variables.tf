variable "key_name" {
  description = "Name of the AWS key pair"
  type        = string
}

variable "private_key_path" {
  description = "Path to the private key file (.pem)"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0f9708d1cd2cfee41" # Amazon Linux 2 AMI (update if needed)
  
}