locals {
  double_values = [for n in var.numbers_list : n * 2]
}

locals {
  names     = [for obj in var.objects_list : obj.name]
  ages      = [for obj in var.objects_list : obj.age]
  usernames = [for obj in var.objects_list : "${obj.name}_${obj.age}"]
}

output "doubled_numbers" {
  value = local.double_values
}

output "usernames" {
  value = local.usernames
}