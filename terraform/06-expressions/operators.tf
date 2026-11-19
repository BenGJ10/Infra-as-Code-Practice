locals {
  math       = 2 * 2         # Results in 4
  equality   = 2 == 2        # Results in true
  comparison = 2 > 1         # Results in true
  logical    = true && false # Results in false
}

output "math_expression" {
  value = {
    math       = local.math
    equality   = local.equality
    comparison = local.comparison
    logical    = local.logical
  }

}