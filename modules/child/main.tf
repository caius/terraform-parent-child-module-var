variable "parent" {
}

locals {
  emantep = strrev(var.parent.petname_id)
}

output "parent_prefix" {
  value = var.parent.prefix
}

output "parent_petname" {
  value = var.parent.petname_id
}

output "petname" {
  value = local.emantep
}
