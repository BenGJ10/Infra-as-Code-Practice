variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "numbers_list" {
  type = list(number)
}

variable "objects_list" {
  type = list(object({
    name = string
    age  = number
  }))
}

variable "numbers_map" {
  type = map(number)
}

variable "user_info" {
  type = list(object({
    name = string
    role = string
  }))
}