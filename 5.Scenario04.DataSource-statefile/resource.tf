data "terraform_remote_state" "network" {
  backend = "local"

  config = {
    path = "../4.Scenario03.Azure-DataSource/terraform.tfstate"
  }
}