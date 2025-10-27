locals {
  # Check if file exists
  yaml_file_exists = fileexists("${path.module}/environment/tf-rg-${var.environment}.yaml")
  # Read and convert YAML file content into a Terraform object
  resource_group_data = local.yaml_file_exists ? yamldecode(file("${path.module}/environment/tf-rg-${var.environment}.yaml")).resource_groups : {}
}