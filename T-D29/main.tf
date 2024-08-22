module "my_module" {
  source         = "./modules/my_module"
  instance_type  = var.instance_type
  bucket_name    = var.bucket_name
}

# output "instance_id" {
#   value = module.my_module.instance_id
# }

# output "bucket_name" {
#   value = module.my_module.bucket_name
# }
