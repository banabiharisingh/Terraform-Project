terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-1010"
    key            = "web_server/terraform.tfstate"
    region         = "ap-south-1"
  }
}