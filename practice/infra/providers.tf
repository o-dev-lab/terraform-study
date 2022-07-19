provider "aws" {
  region = var.region
}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "yk-study"

    workspaces {
      name = "terraform-study"
    }
  }
  }

terraform {
  required_version = ">= 1.1.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.45.0"
    }
  }
}