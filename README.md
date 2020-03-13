# Migrator aws secrets to Vault

This is an example of one time migration of secrets from `aws secrets manager` to `vault service`, pls dont blame for the module that plased inside the configuration part and for the absance of terraform remote backend. Everything was done just for one time purpose. 

example of usage:

```bash
export TF_VAR_vault_role_id=""
export TF_VAR_vault_role_secret_id=""

AWS_PROFILE=<aws-profile-name> terraform plan -out .out

terraform apply .out

```