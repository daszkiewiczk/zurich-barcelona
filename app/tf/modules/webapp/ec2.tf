# resource "aws_placement_group" "webapp_placement_group" {
#   name     = "webapp_placement_group"
#   strategy = "cluster"
# }

# resource "aws_autoscaling_group" "webapp_asg_a" {
#   name                      = "webapp_asg"
#   max_size                  = 3
#   min_size                  = 2
#   desired_capacity          = 2


#   availability_zones = var.availability_zones

#   launch_template {
#     id      = aws_launch_template.zurich_webapp_template_a.id
#     version = "$Latest"
#   }
# }

# resource "aws_launch_template" "zurich_webapp_template_a" {
#   name_prefix   = "zurich_webapp_template_a"
#   image_id      = "ami-06ae0e97bcb59038c"
#   instance_type = var.instance_size
#   vpc_security_group_ids = [aws_security_group.zurich_webapp_sg.id]
#     network_interfaces {
#     associate_public_ip_address = true
#     security_groups = [aws_security_group.zurich_webapp_sg.id]
#   }
#   key_name = aws_key_pair.zurich_webapp_key_a.key_name
# }
# resource "aws_launch_template" "zurich_webapp_template_b" {
#   name_prefix   = "zurich_webapp_template_b"
#   image_id      = "ami-06ae0e97bcb59038c"
#   instance_type = var.instance_size
  
#   vpc_security_group_ids = [aws_security_group.zurich_webapp_sg.id]
#     network_interfaces {
#     associate_public_ip_address = true
#     security_groups = [aws_security_group.zurich_webapp_sg.id]
#   }
#   key_name = aws_key_pair.zurich_webapp_key_b.key_name
# }







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

  tags = {
    Name = "zurich_webapp_b"
  }
}
