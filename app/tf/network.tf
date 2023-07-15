resource "aws_vpc" "zurich_vpc_a" {
  cidr_block = "10.1.0.0/16"
}

resource "aws_subnet" "zurich_webapp_subnet" {
  vpc_id     = aws_vpc.zurich_vpc_a.id
  cidr_block = "10.1.1.0/24"

  tags = {
    Name = "zurich_webapp_subnet"
  }
}

resource "aws_internet_gateway" "zurich_vpc_a_gw" {
  vpc_id = aws_vpc.zurich_vpc_a.id

  tags = {
    Name = "zurhc_vpc_a_gw"
  }
}