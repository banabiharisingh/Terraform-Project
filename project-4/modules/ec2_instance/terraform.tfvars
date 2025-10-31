ami_id        = "ami-0f58b397bc5c1f2e8" # Ubuntu 22.04 in ap-south-1
instance_type = "t3.micro"
name          = "demo"

tags = {
  Project     = "demoapp"
  Environment = "staging"
  ManagedBy   = "Terraform"
}