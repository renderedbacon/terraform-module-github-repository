# resource "github_repository" "instance" {
#   name         = var.name
#   description  = var.description
#   homepage_url = var.homepage_url
#   visibility   = var.visibility
#   topics       = var.topics
#   auto_init    = var.auto_init

#   # TODO: data source the list of templates available to catch errors during planning
#   # https://github.com/github/gitignore
#   gitignore_template = var.gitignore_template

#   # TODO: data source the list of templates available to catch errors during planning
#   # https://github.com/github/choosealicense.com/tree/gh-pages/_licenses
#   license_template = var.license_template

#   allow_merge_commit     = true
#   allow_squash_merge     = true
#   allow_rebase_merge     = true
#   delete_branch_on_merge = false
#   allow_auto_merge       = false

#   squash_merge_commit_title   = "PR_TITLE"
#   squash_merge_commit_message = "BLANK"
#   merge_commit_title          = "MERGE_MESSAGE"
#   merge_commit_message        = "BLANK"

#   has_issues   = true
#   has_projects = true
#   has_wiki     = true

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

#   is_template = var.is_template

#   dynamic "template" {
#     for_each = {}

#     content {
#       owner      = ""
#       repository = ""
#     }
#   }

#   archived           = false
#   archive_on_destroy = true


#   vulnerability_alerts                    = false
#   ignore_vulnerability_alerts_during_read = false
# }

# resource "github_branch_default" "instance" {
#   repository = github_repository.instance
#   branch     = "main"
# }

# resource "github_branch_protection" "instance" {
#   for_each = {}

#   # checkov:skip=CKV_GIT_5:Allow less than 2 approvals for pull requests
#   # checkov:skip=CKV_GIT_6:Allow un-signed commits
#   repository_id   = github_repository.instance.node_id
#   pattern         = "main"
#   enforce_admins  = true
#   allow_deletions = false
# }
