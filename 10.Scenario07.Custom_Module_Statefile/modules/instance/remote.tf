data "terraform_remote_state" "vnet_data" {
  backend = "local"
  config = {
    path = "../vnet/terraform.tfstate"
  }
}