terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-1010"
    key            = "ec2/terraform.tfstate"
    region         = "ap-south-1"
  }
}
