terraform {
  required_version = ">= 1.6"
  required_providers {
    flux = {
      source  = "fluxcd/flux"
      version = ">= 1.1.2"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.20.0"
    }
    github = {
      source  = "integrations/github"
      version = ">= 5.42.0"
    }
  }
}
