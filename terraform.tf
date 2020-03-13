
terraform {
  required_version = "= 0.12.23"
}

provider "vault" {
  version = "= 2.0"

  address = var.vault_address

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = var.vault_role_id
      secret_id = var.vault_role_secret_id
    }
  }
}

provider "aws" {
  region = var.region
}

terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}