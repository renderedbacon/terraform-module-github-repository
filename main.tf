resource "github_repository" "instance" {
  name = var.name

  description  = var.description
  homepage_url = var.homepage_url

  archived = var.archived

  allow_auto_merge                        = module.validation.allow_auto_merge
  allow_merge_commit                      = module.validation.allow_merge_commit
  allow_rebase_merge                      = module.validation.allow_rebase_merge
  allow_squash_merge                      = module.validation.allow_squash_merge
  allow_update_branch                     = module.validation.allow_update_branch
  archive_on_destroy                      = module.validation.archive_on_destroy
  auto_init                               = module.validation.auto_init
  delete_branch_on_merge                  = module.validation.delete_branch_on_merge
  gitignore_template                      = module.validation.gitignore_template
  has_issues                              = module.validation.has_issues
  has_projects                            = module.validation.has_projects
  has_wiki                                = module.validation.has_wiki
  ignore_vulnerability_alerts_during_read = module.validation.ignore_vulnerability_alerts_during_read
  is_template                             = module.validation.is_template
  license_template                        = module.validation.license_template
  merge_commit_message                    = module.validation.merge_commit_message
  merge_commit_title                      = module.validation.merge_commit_title
  squash_merge_commit_message             = module.validation.squash_merge_commit_message
  squash_merge_commit_title               = module.validation.squash_merge_commit_title
  topics                                  = module.validation.topics

  # checkov:skip=CKV_GIT_1:Allow non-private repo even if default is private
  visibility = module.validation.visibility


  vulnerability_alerts = module.validation.vulnerability_alerts

  #   dynamic "pages" {
  #     for_each = {}

  #     content {
  #       source {
  #         branch = "gh-pages"
  #         path   = "/"
  #       }
  #       cname = null
  #     }
  #   }

  #   dynamic "template" {
  #     for_each = {}

  #     content {
  #       owner      = ""
  #       repository = ""
  #     }
  #   }
}

resource "github_branch" "default" {
  for_each = module.validation.create_default_branch ? toset(["enabled"]) : toset([])

  repository = github_repository.instance.id
  branch     = module.validation.default_branch
}

resource "github_branch_default" "instance" {
  for_each = module.validation.create_default_branch ? toset(["enabled"]) : toset([])

  repository = github_repository.instance.id
  branch     = module.validation.default_branch

  depends_on = [
    github_branch.default
  ]
}

locals {
  # TODO merge default and extra branches into single set
}

resource "github_branch" "branches" {
  for_each = toset([])

  repository = github_repository.instance.id
  branch     = each.value
}

locals {
  # TODO merge default and extra branch protections into single set
}

resource "github_branch_protection" "instance" {
  for_each = toset([])

  # checkov:skip=CKV_GIT_5:Allow less than 2 approvals for pull requests
  # checkov:skip=CKV_GIT_6:Allow un-signed commits
  repository_id   = github_repository.instance.node_id
  pattern         = "main"
  enforce_admins  = true
  allow_deletions = false
}
