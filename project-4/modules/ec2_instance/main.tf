resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = merge(var.tags, {
    Name = "${var.name}-web"
    Role = "web"
  })

  # Install Nginx
  provisioner "remote-exec" {
    inline = var.nginx_install_commands

    connection {
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  # Copy index.html
  provisioner "file" {
    source      = var.index_file_path
    destination = var.index_file_destination

    connection {
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  # Move file and restart Nginx
  provisioner "remote-exec" {
    inline = var.nginx_post_copy_commands

    connection {
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }
}