terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

data "cloudflare_zone" "main" {
  name = var.app_domain
}
