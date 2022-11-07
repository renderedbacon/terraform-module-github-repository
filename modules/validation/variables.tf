variable "allow_auto_merge" {
  description = "(Optional) Set to true to allow auto-merging pull requests on the repository. If enabled for a pull request, the pull request will merge automatically when all required reviews are met and status checks have passed. (Default: `false`)"
  type        = bool
  default     = false
}

variable "allow_merge_commit" {
  description = "(Optional) Set to false to disable merge commits on the repository. (Default: `true`)"
  type        = bool
  default     = true
}

variable "allow_rebase_merge" {
  description = "(Optional) Set to true to enable rebase merges on the repository. (Default: `false`)"
  type        = bool
  default     = false
}

variable "allow_squash_merge" {
  description = "(Optional) Set to true to enable squash merges on the repository. (Default: `false`)"
  type        = bool
  default     = false
}

variable "allow_update_branch" {
  description = "(Optional) Set to true to always suggest updating pull request branches. (Default: `true`)"
  type        = bool
  default     = true
}

variable "archive_on_destroy" {
  type        = string
  description = "(Optional) Set to true to enable archiving on delete. (Default: `true`)."
  default     = true
}

variable "archived" {
  description = "(Optional) Specifies if the repository should be archived. (Default: `false`)"
  type        = bool
  default     = false
}

variable "auto_init" {
  description = "(Optional) Whether or not to produce an initial commit in the repository. (Default: `true`)"
  type        = bool
  default     = true
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
      allow_deletiona    = optional(bool, false)
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
  default = []
}

variable "create_default_branch" {
  description = "(Optional) This can only be set after a repository has already been created and the branch has been created in the repository.  By default the default branch will be created when the repository is created. (Default: `true`)"
  type        = bool
  default     = true
}

variable "default_branch" {
  description = "(Optional) The name of the default branch of the repository. (Default: `main`)"
  type        = string
  default     = "main"
}

variable "delete_branch_on_merge" {
  description = "(Optional) Whether or not to delete the merged branch after merging a pull request. (Default: `false`)"
  type        = bool
  default     = false
}

# TODO: lookup list of valid options using external data
variable "gitignore_template" {
  description = "(Optional) Use the name of the template without the extension. For example, `python`. Available templates: https://github.com/github/gitignore. (Default: `null`)"
  type        = string
  default     = null
}

variable "has_issues" {
  description = "(Optional) Set to true to enable the GitHub Issues features on the repository. (Default: `false`)"
  type        = bool
  default     = false
}

variable "has_projects" {
  description = "(Optional) Set to true to enable the GitHub Projects features on the repository. If you specify true when it has been disabled in an organization it will return an error.  (Default: `false`)"
  type        = bool
  default     = false
}

variable "has_wiki" {
  description = "(Optional) Set to true to enable the GitHub Wiki features on the repository. (Default: `false`)"
  type        = bool
  default     = false
}

variable "homepage_url" {
  description = "(Optional) The website url of the repository. (Default: `null`)"
  type        = string
  default     = null
}

variable "ignore_vulnerability_alerts_during_read" {
  description = "(Optional) Set to true to not call the vulnerability alerts endpoint so the resource can also be used without admin permissions during read. (Default: `false`)"
  type        = bool
  default     = false
}

variable "is_template" {
  description = "(Optional) Whether or not this is a template repository. (Default: `false`)"
  type        = bool
  default     = false
}

# TODO: lookup list of valid options using external data
variable "license_template" {
  description = "(Optional) Use the name of the template without the extension. For example, `mit` or `apache-2.0`. Available licences: https://github.com/github/choosealicense.com/tree/gh-pages/_licenses. (Default: `null`)"
  type        = string
  default     = null
}

variable "merge_commit_message" {
  description = "(Optional) Can be `PR_BODY`, `PR_TITLE`, or `BLAMK`. (Default: `BLANK`)"
  type        = string
  default     = "BLANK"

  validation {
    condition     = contains(["PR_BODY", "PR_TITLE", "BLANK"], var.merge_commit_message)
    error_message = "Invalid merge commit message.  Allowed values are: `PR_BODY`, `PR_TITLE`, or `BLANK`."
  }
}

variable "merge_commit_title" {
  description = "(Optional) Can be `PR_TITLE` or `MERGE_MESSAGE`. (Default: `MERGE_MESSAGE`)"
  type        = string
  default     = "MERGE_MESSAGE"

  validation {
    condition     = contains(["PR_TITLE", "MERGE_MESSAGE"], var.merge_commit_title)
    error_message = "Invalid merge commit title.  Allowed values are: `PR_TITLE` or `MERGE_MESSAGE`."
  }
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
  default = []

  validation {
    condition     = length(var.pages) <= 1
    error_message = "Invalid number of pages configurations.  Only 1 configuration is allowed."
  }
}

variable "permissions_by_collaborator" {
  description = "(Optional) List of collaborators and permissions. (Default: `[]`)"
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
  default = []
}

variable "squash_merge_commit_message" {
  description = "(Optional) Can be `PR_BODY`, `COMMIT_MESSAGES`, or `BLANK`. (Default: `BLANK`)"
  type        = string
  default     = "BLANK"

  validation {
    condition     = contains(["PR_BODY", "COMMIT_MESSAGES", "BLANK"], var.squash_merge_commit_message)
    error_message = "Invalid squash merge commit message.  Allowed values are: `PR_BODY`, `COMMIT_MESSAGES`, or `BLANK`."
  }
}

variable "squash_merge_commit_title" {
  description = "(Optional) Can be `PR_TITLE` or `COMMIT_OR_PR_TITLE`. (Default: `COMMIT_OR_PR_TITLE`)"
  type        = string
  default     = "COMMIT_OR_PR_TITLE"

  validation {
    condition     = contains(["PR_TITLE", "COMMIT_OR_PR_TITLE"], var.squash_merge_commit_title)
    error_message = "Invalid squash merge commit title.  Allowed values are: `PR_TITLE` or `COMMIT_OR_PR_TITLE`."
  }
}

variable "template" {
  description = "(Optional) Template repository to use. (Default: `{}`)"
  type = list(
    object({
      owner      = string
      repository = string
    })
  )
  default = []

  validation {
    condition     = length(var.template) <= 1
    error_message = "Invalid number of template configurations.  Only 1 configuration is allowed."
  }
}

variable "topics" {
  description = "(Optional) The set of topics of the repository.  (Default: `toset([])`)"
  type        = set(string)
  default     = toset([])
}

variable "visibility" {
  description = "(Optional) Repository visibility.  Valid values are: `private`, `public`, or `internal`. (Default: `private`)"
  type        = string
  default     = "private"

  validation {
    condition     = contains(["private", "public", "internal"], var.visibility)
    error_message = "Invalid repository visibility.  Allowed values are: `private`, `public`, or `internal`."
  }
}

variable "vulnerability_alerts" {
  description = "(Optional) Set to true to enable security alerts for vulnerable dependencies. (Default: `true`)"
  type        = bool
  default     = true
}
