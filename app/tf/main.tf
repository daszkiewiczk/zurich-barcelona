terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "webapp" {
  source             = "./modules/webapp"
  subnet_id          = aws_subnet.zurich_webapp_subnet.id
  instance_size      = var.webapp_instance_size
  availability_zones = var.webapp_azs
  vpc_id             = aws_vpc.zurich_vpc_a.id
}