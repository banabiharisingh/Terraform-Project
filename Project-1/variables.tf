
variable "region" {
  description = "AWS region"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}


variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}


variable "profile_name" {
  description = "IAM instance profile name"
  type        = string
}

variable "policy_name" {
  description = "IAM policy name"
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 1
}