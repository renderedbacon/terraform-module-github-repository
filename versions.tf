terraform {
  required_version = ">= 1.1"

  providersrequired_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.3.0"
    }
  }
}
