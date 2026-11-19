locals {
  doubles_map = { for k, v in var.numbers_map : k => v * 2 }
  even_map    = { for k, v in var.numbers_map : k => v if v % 2 == 0 }
}

locals {
  users_map = { for user in var.user_info : user.name => user.role }
}


output "doubles_map" {
  value = local.doubles_map
}

output "even_map" {
  value = local.even_map
}

output "users_map" {
  value = local.users_map
}