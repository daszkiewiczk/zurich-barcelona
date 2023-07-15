variable "webapp_instance_size" {
    type = string
    default = "t2.micro"
}

variable "webapp_azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

