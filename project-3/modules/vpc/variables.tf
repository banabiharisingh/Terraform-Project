variable "environment" {
  description = "Environment name (staging or production)"
  type        = string
}

variable "tags" {
  description = "Tags to apply to VPC resources"
  type        = map(string)
}