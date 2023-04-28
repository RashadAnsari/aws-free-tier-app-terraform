# AWS Free Tier App Terraform

[![Build](https://github.com/RashadAnsari/aws-free-tier-app-terraform/actions/workflows/build.yml/badge.svg?branch=master)](https://github.com/RashadAnsari/aws-free-tier-app-terraform/actions/workflows/build.yml)

AWS free tier app Terraform module.

# Usage

```hcl
module "app" {
  source = "git::https://github.com/RashadAnsari/aws-free-tier-app-terraform.git?ref=v1.0.4"

  app_name              = "AppName"
  app_env               = "production"
  app_domain            = "app.io"
  web_app_port          = 8080
  api_app_port          = 8000
  aws_ami               = "ami-06d1a5507784edbad"
  db_username           = "db_user"
  db_password           = var.db_password
  web_server_count      = 1
  web_server_public_key = file("id_rsa.pub")
  cloudwatch_alarms     = true
}
```
