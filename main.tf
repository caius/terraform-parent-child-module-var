module "parent" {
  source = "./modules/parent"
  prefix = "sandy-beach"
}

module "child" {
  source = "./modules/child"
  parent = module.parent
}

output "parent_petname" {
  value = module.parent.petname_id
}

output "child_prefix" {
  value = module.child.parent_prefix
}

output "child_petname" {
  value = module.child.petname
}

output "child_parent_petname" {
  value = module.child.parent_petname
}
