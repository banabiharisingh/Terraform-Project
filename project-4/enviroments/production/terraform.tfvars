# General settings
name                = "prod-app"
project     = "WebApp"
environment = "Production"
owner       = "Banabihari"
region = "ap-south-1"

tags = {
  Environment = "Production"
  Owner       = "Banabihari"
  Project     = "WebApp"
}

# VPC settings
cidr_block          = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"
availability_zone   = "ap-south-1a"

# EC2 settings
ami_id              = "ami-00af95fa354fdb788"         # Replace with a valid Ubuntu AMI ID
instance_type       = "t2.micro"
key_name            = "aws_key"                    # Replace with your actual key name
private_key_path    = "./aws_key.pem"
ssh_user            = "ec2-user"

# Provisioning settings
index_file_path         = "./index.html"
index_file_destination  = "/tmp/index.html"

nginx_install_commands = [
  "sudo dnf update -y",
  "sudo dnf install -y nginx",
  "sudo systemctl start nginx",
  "sudo systemctl enable nginx"
]

nginx_post_copy_commands = [
  "sudo mv /tmp/index.html /var/www/html/index.html",
  "sudo systemctl restart nginx"
]

ingress_rules = [
  {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]