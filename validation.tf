module "validation" {
  source = "./modules/validation"

  allow_auto_merge                        = var.allow_auto_merge != null ? var.allow_auto_merge : var.defaults.allow_auto_merge
  allow_merge_commit                      = var.allow_merge_commit != null ? var.allow_merge_commit : var.defaults.allow_merge_commit
  allow_rebase_merge                      = var.allow_rebase_merge != null ? var.allow_rebase_merge : var.defaults.allow_rebase_merge
  allow_squash_merge                      = var.allow_squash_merge != null ? var.allow_squash_merge : var.defaults.allow_squash_merge
  allow_update_branch                     = var.allow_update_branch != null ? var.allow_update_branch : var.defaults.allow_update_branch
  archive_on_destroy                      = var.archive_on_destroy != null ? var.archive_on_destroy : var.defaults.archive_on_destroy
  auto_init                               = var.auto_init != null ? var.auto_init : var.defaults.auto_init
  branch_protections                      = var.branch_protections != null ? var.branch_protections : var.defaults.branch_protections
  branches                                = var.branches != null ? var.branches : var.defaults.branches
  create_default_branch                   = var.create_default_branch != null ? var.create_default_branch : var.defaults.create_default_branch
  default_branch                          = var.default_branch != null ? var.default_branch : var.defaults.default_branch
  delete_branch_on_merge                  = var.delete_branch_on_merge != null ? var.delete_branch_on_merge : var.defaults.delete_branch_on_merge
  gitignore_template                      = var.gitignore_template != null ? var.gitignore_template : var.defaults.gitignore_template
  has_issues                              = var.has_issues != null ? var.has_issues : var.defaults.has_issues
  has_projects                            = var.has_projects != null ? var.has_projects : var.defaults.has_projects
  has_wiki                                = var.has_wiki != null ? var.has_wiki : var.defaults.has_wiki
  ignore_vulnerability_alerts_during_read = var.ignore_vulnerability_alerts_during_read != null ? var.ignore_vulnerability_alerts_during_read : var.defaults.ignore_vulnerability_alerts_during_read
  is_template                             = var.is_template != null ? var.is_template : var.defaults.is_template
  license_template                        = var.license_template != null ? var.license_template : var.defaults.license_template
  merge_commit_message                    = var.merge_commit_message != null ? var.merge_commit_message : var.defaults.merge_commit_message
  merge_commit_title                      = var.merge_commit_title != null ? var.merge_commit_title : var.defaults.merge_commit_title
  pages                                   = var.pages != null ? var.pages : var.defaults.pages
  permisisons_by_team                     = var.permisisons_by_team != null ? var.permisisons_by_team : var.defaults.permisisons_by_team
  squash_merge_commit_message             = var.squash_merge_commit_message != null ? var.squash_merge_commit_message : var.defaults.squash_merge_commit_message
  squash_merge_commit_title               = var.squash_merge_commit_title != null ? var.squash_merge_commit_title : var.defaults.squash_merge_commit_title
  template                                = var.template != null ? var.template : var.defaults.template
  topics                                  = var.topics != null ? var.topics : var.defaults.topics
  visibility                              = var.visibility != null ? var.visibility : var.defaults.visibility
  vulnerability_alerts                    = var.vulnerability_alerts != null ? var.vulnerability_alerts : var.defaults.vulnerability_alerts
}

# locals {
#   allow_auto_merge   =
#   allow_merge_commit =
#   allow_rebase_merge =
#   allow_squash_merge =
#   archive_on_destroy =
#   auto_init          =
#   branch_protections = optional(
#     list(
#       object({
#         pattern                         = string
#         enforce_admins                  = optional(bool, false)
#         require_signed_commits          = optional(bool, false)
#         require_linear_history          = optional(bool, false)
#         require_conversation_resolution = optional(bool, false)
#         required_status_checks = optional(
#           object({
#             strict   = optional(bool, false)
#             contexts = optional(list(string), [])
#           }), null
#         )
#         required_pull_request_reviews = optional(
#           object({
#             dismiss_stale_reviews           = optional(bool, false)
#             restrict_dismissals             = optional(bool, false)
#             dismissal_restrictions          = optional(list(string), [])
#             pull_request_bypassers          = optional(list(string), [])
#             require_code_owner_reviews      = optional(bool, false)
#             required_approving_review_count = optional(number, 2)
#           }), null
#         )
#         push_restrictions  = optional(list(string), [])
#         allow_deletiona    = optional(bool, false)
#         allow_force_pushes = optional(bool, false)
#         block_creations    = optional(bool, false)
#       })
#     ), []
#   )
#   branches = optional(
#     list(
#       object({
#         name          = string
#         source_branch = optional(string)
#         source_sha    = optional(string)
#       })
#     ), []
#   )
#   create_default_branch                   = optional(bool, true)
#   default_branch                          = optional(string, "main")
#   delete_branch_on_merge                  = optional(bool, false)
#   gitignore_template                      = optional(string)
#   has_issues                              = optional(bool, false)
#   has_projects                            = optional(bool, false)
#   has_wiki                                = optional(bool, false)
#   ignore_vulnerability_alerts_during_read = optional(bool, false)
#   is_template                             = optional(bool, false)
#   license_template                        = optional(string)
#   merge_commit_message                    = optional(string, "BLANK")
#   merge_commit_title                      = optional(string, "MERGE_MESSAGE")
#   pages = optional(
#     object({
#       branch = string
#       path   = optional(string)
#       cname  = optional(string, "/")
#     }), {}
#   )
#   permissions_by_collaborator = optional(
#     list(
#       object({
#         username   = string
#         permission = string
#       })
#     ), []
#   )
#   permisisons_by_team = optional(
#     list(
#       object({
#         team_id    = string
#         permission = string
#       })
#     ), []
#   )
#   squash_merge_commit_message = optional(string, "BLANK")
#   squash_merge_commit_title   = optional(string, "COMMIT_OR_PR_TITLE")
#   template = optional(
#     object({
#       owner      = string
#       repository = string
#     }), {}
#   )
#   topics               = optional(list(string), [])
#   visibility           = optional(string, "private")
#   vulnerability_alerts = optional(bool, true)
# }
