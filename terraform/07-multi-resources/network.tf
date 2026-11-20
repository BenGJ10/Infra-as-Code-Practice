locals {
  project_name = "multi-resources"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Project = local.project_name
    Name    = "${local.project_name}-vpc"
  }
}

resource "aws_subnet" "subnets" {
  count      = var.subnet_count
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.${count.index}.0/24"

  tags = {
    Project = local.project_name
    Name    = "${local.project_name}-subnet-${count.index + 1}"
  }
}