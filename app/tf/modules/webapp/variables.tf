variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type        = string
  description = "Id of subnet in which to spawn the webapp ec2 instances."
}

variable "instance_size" {
  type    = string
  default = "t2.micro"
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

