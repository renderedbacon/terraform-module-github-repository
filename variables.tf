# REQUIRED VARIABLES

variable "name" {
  description = "Name of the repository."
  type        = string
}

# OPTIONAL DEFAULTS

variable "defaults" {
  description = "(Optional) Defaults for optional repository settings."
  type = object({
    allow_auto_merge    = optional(bool, false)
    allow_merge_commit  = optional(bool, true)
    allow_rebase_merge  = optional(bool, false)
    allow_squash_merge  = optional(bool, false)
    allow_update_branch = optional(bool, true)
    archive_on_destroy  = optional(bool, true)
    auto_init           = optional(bool, true)
    branch_protections = optional(
      list(
        object({
          pattern                         = string
          enforce_admins                  = optional(bool, false)
          require_signed_commits          = optional(bool, false)
          require_linear_history          = optional(bool, false)
          require_conversation_resolution = optional(bool, false)
          required_status_checks = optional(
            object({
              strict   = optional(bool, false)
              contexts = optional(list(string), [])
            }), null
          )
          required_pull_request_reviews = optional(
            object({
              dismiss_stale_reviews           = optional(bool, false)
              restrict_dismissals             = optional(bool, false)
              dismissal_restrictions          = optional(list(string), [])
              pull_request_bypassers          = optional(list(string), [])
              require_code_owner_reviews      = optional(bool, false)
              required_approving_review_count = optional(number, 2)
            }), null
          )
          push_restrictions  = optional(list(string), [])
          allows_deletions   = optional(bool, false)
          allow_force_pushes = optional(bool, false)
          block_creations    = optional(bool, false)
        })
      ), []
    )
    branches = optional(
      list(
        object({
          name          = string
          source_branch = optional(string)
          source_sha    = optional(string)
        })
      ), []
    )
    create_default_branch                   = optional(bool, true)
    default_branch                          = optional(string, "main")
    delete_branch_on_merge                  = optional(bool, false)
    gitignore_template                      = optional(string)
    has_issues                              = optional(bool, false)
    has_projects                            = optional(bool, false)
    has_wiki                                = optional(bool, false)
    ignore_vulnerability_alerts_during_read = optional(bool, false)
    is_template                             = optional(bool, false)
    license_template                        = optional(string)
    merge_commit_message                    = optional(string, "BLANK")
    merge_commit_title                      = optional(string, "MERGE_MESSAGE")
    pages = optional(
      list(
        object({
          branch = string
          path   = optional(string)
          cname  = optional(string, "/")
        })
      ), []
    )
    permissions_by_collaborator = optional(
      list(
        object({
          username   = string
          permission = string
        })
      ), []
    )
    permisisons_by_team = optional(
      list(
        object({
          team_id    = string
          permission = string
        })
      ), []
    )
    squash_merge_commit_message = optional(string, "BLANK")
    squash_merge_commit_title   = optional(string, "COMMIT_OR_PR_TITLE")
    template = optional(
      list(
        object({
          owner      = string
          repository = string
        })
      ), []
    )
    topics               = optional(list(string), [])
    visibility           = optional(string, "private")
    vulnerability_alerts = optional(bool, true)
  })
  default = {}
}

# OPTIONAL VARIABLES

variable "allow_auto_merge" {
  description = "(Optional) Set to true to allow auto-merging pull requests on the repository. If enabled for a pull request, the pull request will merge automatically when all required reviews are met and status checks have passed. (Default: `false`)"
  type        = bool
  default     = null
}

variable "allow_merge_commit" {
  description = "(Optional) Set to false to disable merge commits on the repository. (Default: `true`)"
  type        = bool
  default     = null
}

variable "allow_rebase_merge" {
  description = "(Optional) Set to true to enable rebase merges on the repository. (Default: `false`)"
  type        = bool
  default     = null
}

variable "allow_squash_merge" {
  description = "(Optional) Set to true to enable squash merges on the repository. (Default: `false`)"
  type        = bool
  default     = null
}

variable "allow_update_branch" {
  description = "(Optional) Set to true to always suggest updating pull request branches."
  type        = bool
  default     = null
}

variable "archive_on_destroy" {
  type        = string
  description = "(Optional) Set to true to enable archiving on delete. (Default: `true`)."
  default     = null
}

variable "archived" {
  description = "(Optional) Specifies if the repository should be archived. (Default: `false`)"
  type        = bool
  default     = false
}

variable "auto_init" {
  description = "(Optional) Whether or not to produce an initial commit in the repository. (Default: `true`)"
  type        = bool
  default     = null
}

variable "branch_protections" {
  description = "(Optional) A list of branch protections to apply to the repository. (Default: `[]`)"
  type = list(
    object({
      pattern                         = string
      enforce_admins                  = optional(bool, false)
      require_signed_commits          = optional(bool, false)
      require_linear_history          = optional(bool, false)
      require_conversation_resolution = optional(bool, false)
      required_status_checks = optional(
        object({
          strict   = optional(bool, false)
          contexts = optional(list(string), [])
        })
      )
      required_pull_request_reviews = optional(
        object({
          dismiss_stale_reviews           = optional(bool, false)
          restrict_dismissals             = optional(bool, false)
          dismissal_restrictions          = optional(list(string), [])
          pull_request_bypassers          = optional(list(string), [])
          require_code_owner_reviews      = optional(bool, false)
          required_approving_review_count = optional(number, 2)
        })
      )
      push_restrictions  = optional(list(string), [])
      allows_deletions   = optional(bool, false)
      allow_force_pushes = optional(bool, false)
      block_creations    = optional(bool, false)
    })
  )
  default = null
}

variable "extra_branch_protections" {
  description = "(Optional) An extra list of branch protections to apply to the repository. (Default: `[]`)"
  type = list(
    object({
      pattern                         = string
      enforce_admins                  = optional(bool, false)
      require_signed_commits          = optional(bool, false)
      require_linear_history          = optional(bool, false)
      require_conversation_resolution = optional(bool, false)
      required_status_checks = optional(
        object({
          strict   = optional(bool, false)
          contexts = optional(list(string), [])
        }), null
      )
      required_pull_request_reviews = optional(
        object({
          dismiss_stale_reviews           = optional(bool, false)
          restrict_dismissals             = optional(bool, false)
          dismissal_restrictions          = optional(list(string), [])
          pull_request_bypassers          = optional(list(string), [])
          require_code_owner_reviews      = optional(bool, false)
          required_approving_review_count = optional(number, 2)
        }), null
      )
      push_restrictions  = optional(list(string), [])
      allows_deletions   = optional(bool, false)
      allow_force_pushes = optional(bool, false)
      block_creations    = optional(bool, false)
    })
  )
  default = []
}


variable "branches" {
  description = "(Optional) List of branches to be created in the repository. (Default: `[]`)"
  type = list(
    object({
      name          = string
      source_branch = optional(string)
      source_sha    = optional(string)
    })
  )
  default = null
}

variable "extra_branches" {
  description = "(Optional) Extra list of branches to be created in the repository. (Default: `[]`)"
  type = list(
    object({
      name          = string
      source_branch = optional(string)
      source_sha    = optional(string)
    })
  )
  default = []
}

variable "create_default_branch" {
  description = "(Optional) This can only be set after a repository has already been created and the branch has been created in the repository.  By default the default branch will be created when the repository is created. (Default: `true`)"
  type        = bool
  default     = null
}

variable "default_branch" {
  description = "(Optional) The name of the default branch of the repository. (Default: `main`)"
  type        = string
  default     = null
}

variable "delete_branch_on_merge" {
  description = "(Optional) Whether or not to delete the merged branch after merging a pull request. (Default: `false`)"
  type        = bool
  default     = null
}

variable "description" {
  description = "(Optional) Short description of the repository. (Default: `\"\"`)"
  type        = string
  default     = ""
}

variable "gitignore_template" {
  description = "(Optional) Use the name of the template without the extension. For example, `python`. Available templates: https://github.com/github/gitignore. (Default: `null`)"
  type        = string
  default     = null
}

variable "has_issues" {
  description = "(Optional) Set to true to enable the GitHub Issues features on the repository. (Default: `false`)"
  type        = bool
  default     = null
}

variable "has_projects" {
  description = "(Optional) Set to true to enable the GitHub Projects features on the repository. If you specify true when it has been disabled in an organization it will return an error.  (Default: `false`)"
  type        = bool
  default     = null
}

variable "has_wiki" {
  description = "(Optional) Set to true to enable the GitHub Wiki features on the repository. (Default: `false`)"
  type        = bool
  default     = null
}

variable "homepage_url" {
  description = "(Optional) The website url of the repository. (Default: `null`)"
  type        = string
  default     = null
}

variable "ignore_vulnerability_alerts_during_read" {
  description = "(Optional) Set to true to not call the vulnerability alerts endpoint so the resource can also be used without admin permissions during read. (Default: `false`)"
  type        = bool
  default     = null
}

variable "is_template" {
  description = "(Optional) Whether or not this is a template repository. (Default: `false`)"
  type        = bool
  default     = null
}

variable "license_template" {
  description = "(Optional) Use the name of the template without the extension. For example, `mit` or `apache-2.0`. Available licences: https://github.com/github/choosealicense.com/tree/gh-pages/_licenses. (Default: `null`)"
  type        = string
  default     = null
}

variable "merge_commit_message" {
  description = "(Optional) Can be `PR_BODY`, `PR_TITLE`, or `BLAMK`. (Default: `BLANK`)"
  type        = string
  default     = null
}

variable "merge_commit_title" {
  description = "(Optional) Can be `PR_TITLE` or `MERGE_MESSAGE`. (Default: `MERGE_MESSAGE`)"
  type        = string
  default     = null
}

variable "pages" {
  description = "(Optional) The repository's GitHub Pages configuration. (Default: `{}`)"
  type = list(
    object({
      branch = string
      path   = optional(string)
      cname  = optional(string, "/")
    })
  )
  default = null
}

variable "permissions_by_collaborator" {
  description = "(Optional) List of collaborators and permissions. (Default: `[]`)"
  type = list(
    object({
      username   = string
      permission = string
    })
  )
  default = null
}

variable "extra_permissions_by_collaborator" {
  description = "(Optional) Extra list of collaborators and permissions. (Default: `[]`)"
  type = list(
    object({
      username   = string
      permission = string
    })
  )
  default = []
}

variable "permisisons_by_team" {
  description = "(Optional) List of teams and permissions. (Default: `[]`)"
  type = list(
    object({
      team_id    = string
      permission = string
    })
  )
  default = null
}

variable "extra_permisisons_by_team" {
  description = "(Optional) Extra list of teams and permissions. (Default: `[]`)"
  type = list(
    object({
      team_id    = string
      permission = string
    })
  )
  default = []
}

variable "squash_merge_commit_message" {
  description = "(Optional) Can be `PR_BODY`, `COMMIT_MESSAGES`, or `BLANK`. (Default: `BLANK`)"
  type        = string
  default     = null
}

variable "squash_merge_commit_title" {
  description = "(Optional) Can be `PR_TITLE` or `COMMIT_OR_PR_TITLE`. (Default: `COMMIT_OR_PR_TITLE`)"
  type        = string
  default     = null
}

variable "template" {
  description = "(Optional) Template repository to use. (Default: `{}`)"
  type = list(
    object({
      owner      = string
      repository = string
    })
  )
  default = null
}

variable "topics" {
  description = "(Optional) The list of topics of the repository.  (Default: `[]`)"
  type        = list(string)
  default     = null
}

variable "extra_topics" {
  description = "(Optional) Extra list of topics of the repository.  (Default: `[]`)"
  type        = list(string)
  default     = null
}

variable "visibility" {
  description = "(Optional) Repository visibility.  Valid values are: `private`, `public`, or `internal`. (Default: `private`)"
  type        = string
  default     = null
}

variable "vulnerability_alerts" {
  description = "(Optional) Set to true to enable security alerts for vulnerable dependencies. (Default: `true`)"
  type        = bool
  default     = null
}
