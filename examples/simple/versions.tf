terraform {
  required_version = ">= 1.1"

  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 5.3.0"
    }
  }
}
