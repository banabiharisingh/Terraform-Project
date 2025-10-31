
# Primary AWS provider for Staging
provider "aws" {
  region  = var.region

  # Apply consistent tags to everything created in this environment
  default_tags {
    tags = {
      Project     = var.project
      Environment = var.environment
      Owner       = var.owner
      ManagedBy   = "Terraform"
    }
  }
}