resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  
tags = {
    Name = "main"
  }
}
resource "aws_subnet" "sub_1" {
 vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet_1"
  }
}
resource "aws_subnet" "sub_2" {
 vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet_2"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "internet-getways"

  }
}
  
resource "aws_route_table" "route_1" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  }

resource "aws_route_table_association" "a" {
  subnet_id = aws_subnet.sub_1.id
  route_table_id = aws_route_table.route_1.id
}