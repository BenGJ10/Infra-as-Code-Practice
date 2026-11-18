locals {
  common_tags = {
    ManagedBy = "Terraform"
    Owner     = "Ben Gregory"
  }
}

resource "aws_vpc" "nginx_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = merge(local.common_tags, {
    Name = "Nginx_VPC"
  })
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.nginx_vpc.id
  cidr_block = "10.0.0.0/24"
  tags = merge(local.common_tags, {
    Name = "Nginx_Public_Subnet"
  })
}

resource "aws_internet_gateway" "nginx_igw" {
  vpc_id = aws_vpc.nginx_vpc.id

  tags = merge(local.common_tags, {
    Name = "Nginx_IGW"
  })
}

resource "aws_route_table" "nginx_route_table" {
  vpc_id = aws_vpc.nginx_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.nginx_igw.id
  }

  tags = merge(local.common_tags, {
    Name = "Nginx_Route_Table"
  })
}

resource "aws_route_table_association" "nginx_route_table_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.nginx_route_table.id
}