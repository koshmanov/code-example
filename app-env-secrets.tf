locals {
  secrets = [
    "test1-secret",
    "test2-secret",
    "mysql-test1-db-creds",
    "mysql-test2-db-creds",
    "test12-secret",
    "test22-secret",
    "jb-secret",
    "email-secret",
    "test5-secret",
    "mysql-db-creds1",
    "mysql-account-db-creds",
    "mysql-db-creds",
    "mysql-social-db-creds",
    "mysql-example-db-creds",
    "mysql-example1-db-creds",
    "mysql-notification-db-creds",
    "example-client-secret",
    "example4-secret",
    "mysql-act-db-creds",
    "new-relic-secret"
  ]
}

module "sec-dev" {
  source  = "./secrets-migration-module"
  env     = "dev"
  secrets = local.secrets
}

module "sec-qa" {
  source  = "./secrets-migration-module"
  env     = "qa"
  secrets = local.secrets
}

module "sec-uat" {
  source  = "./secrets-migration-module"
  env     = "uat"
  secrets = local.secrets
}