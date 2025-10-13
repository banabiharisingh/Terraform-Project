provider "aws" {
  region = "ap-south-1" # Mumbai region (closest to Bangalore)
}

resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow SSH and HTTP access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from anywhere (you can restrict to your IP)
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "web_server" {
  ami           = var.ami_id # Amazon Linux 2 AMI (update if needed)
  instance_type = "t2.micro"
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  provisioner "remote-exec" {
    inline = [
  "sudo dnf update -y",
  "sudo dnf install nginx -y",
  "sudo systemctl start nginx",
  "sudo systemctl enable nginx"
]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  provisioner "file" {
    source      = "index.html"
    destination = "/tmp/index.html"

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mv /tmp/index.html /usr/share/nginx/html/index.html",
      "sudo systemctl restart nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  tags = {
    Name = "TerraformWebServer"
  }
}
