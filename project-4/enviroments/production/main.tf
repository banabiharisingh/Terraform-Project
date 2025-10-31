module "vpc" {
  source              = "../../modules/vpc"
  name                = var.name
  cidr_block          = var.cidr_block
  public_subnet_cidr  = var.public_subnet_cidr
  availability_zone   = var.availability_zone
  tags                = var.tags
}

module "ec2_instance" {
  source                  = "../../modules/ec2_instance"
  ami_id                  = var.ami_id
  instance_type           = var.instance_type
  name                    = var.name
  tags                    = var.tags
  subnet_id               = module.vpc.public_subnet_id
  key_name                = var.key_name
  private_key_path        = var.private_key_path
  ssh_user                = var.ssh_user
  index_file_path         = "${path.module}/index.html"
  index_file_destination  = var.index_file_destination
  nginx_install_commands  = var.nginx_install_commands
  nginx_post_copy_commands = var.nginx_post_copy_commands
  ingress_rules             = var.ingress_rules
  vpc_id = module.vpc.vpc_id
}
