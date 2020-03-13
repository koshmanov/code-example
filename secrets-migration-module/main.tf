locals {
  secrets            = var.secrets
  vault_secrets_path = var.vault_secrets_path
  vault_sp_env       = var.env
}

data "aws_secretsmanager_secret" "all" {
  count = length(local.secrets)
  name  = "app-np-kv-${local.vault_sp_env}-${local.secrets[count.index]}"
}

data "aws_secretsmanager_secret_version" "all" {
  count     = length(local.secrets)
  secret_id = "${data.aws_secretsmanager_secret.all.*.id[count.index]}"
}

resource "vault_generic_secret" "all" {
  count = length(local.secrets)
  path  = "${local.vault_secrets_path}/${local.vault_sp_env}/${local.secrets[count.index]}"

  data_json = data.aws_secretsmanager_secret_version.all.*.secret_string[count.index]
}