


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "zurich_webapp_a" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_size

  subnet_id = var.subnet_id
  
  associate_public_ip_address = true
  key_name = aws_key_pair.zurich_webapp_key_a.key_name
  security_groups = [aws_security_group.zurich_webapp_sg.id]

    provisioner "file" {
    source      = "${path.root}/../app"
    destination = "~/app"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${path.module}/keys/webapp_key_a"
      host        = "${self.public_dns}"
    }
    user_data = <<-EOF

                    #!/bin/bash

                    python3 -m flask run ~/app

                  EOF

  }


  tags = {
    Name = "zurich_webapp_a"
  }
}


resource "aws_instance" "zurich_webapp_b" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_size

  subnet_id = var.subnet_id


  associate_public_ip_address = true
  key_name = aws_key_pair.zurich_webapp_key_b.key_name
  
  security_groups = [aws_security_group.zurich_webapp_sg.id]
  provisioner "file" {
    source      = "${path.root}/../app"
    destination = "~/app"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${path.module}/keys/webapp_key_a"
      host        = "${self.public_dns}"
    }
  user_data = <<-EOF

                    #!/bin/bash

                    python3 -m flask run ~/app

                  EOF
  tags = {
    Name = "zurich_webapp_b"
  }
}
