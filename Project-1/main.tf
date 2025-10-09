provider "aws" {
    region = var.region
}


resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name = "Terraform-EC2"
  }
}
