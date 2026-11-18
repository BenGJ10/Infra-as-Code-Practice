locals {
  project_owner = "Ben Gregory John"
  managed_by    = "Terraform"
}

locals {
  common_tags = {
    ProjectOwner = local.project_owner
    ManagedBy    = local.managed_by
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "demo_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  root_block_device {
    delete_on_termination = true
    volume_size           = var.ec2_volume_config.size
    volume_type           = var.ec2_volume_config.type
  }

  tags = merge(
    local.common_tags,
    {
      Name = "DemoInstance"
    }
  )
}