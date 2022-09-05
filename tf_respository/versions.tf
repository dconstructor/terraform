terraform {
  required_version = "~> 1.2.8"
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

locals {
  repositories = ["example1", "example2"]
}

provider "github" {
  token = ""
}

module "github_mod" {
  count           = length(local.repositories)
  source          = "./modules/mod_gh"
  repository_name = local.repositories[count.index]
}
