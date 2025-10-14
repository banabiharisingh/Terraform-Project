locals {
  tags = {
    Environment = var.environment
    Project     = "TerraformFramework"
  }
}

module "vpc" {
  source     = "./modules/vpc"
  environment = var.environment
  tags        = local.tags
}

module "ec2" {
  source         = "./modules/ec2"
  vpc_id         = module.vpc.vpc_id
  subnet_id      = module.vpc.public_subnet_id
  instance_count = var.instance_count
  environment    = var.environment
  tags           = local.tags
}