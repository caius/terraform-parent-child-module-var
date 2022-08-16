variable "prefix" {
}

resource "random_pet" "this" {
  keepers = {
    prefix = var.prefix
  }
}

output "petname_id" {
  value = random_pet.this.id
}

output "prefix" {
  value = var.prefix
}
