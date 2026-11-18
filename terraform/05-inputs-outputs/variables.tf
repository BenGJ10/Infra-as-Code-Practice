variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "Type of AWS EC2 instance"
  type        = string
  default     = "t2.micro"

  validation {
    error_message = "Instance type must be one of t2.micro, t2.small, t3.micro, t3.small"
    condition     = contains(["t2.micro", "t2.small", "t3.micro", "t3.small"], var.instance_type)
  }
}

variable "ec2_volume_config" {
  description = "Configuration for EC2 root volume"

  type = object({
    size = number
    type = string
  })

  default = {
    size = 8
    type = "gp2"
  }
}