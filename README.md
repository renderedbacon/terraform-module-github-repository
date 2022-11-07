# Terraform Module: GitHub Repository

This Terraform module creates and manages a GitHub Repository.

<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- terraform (>= 1.1)

- github (~> 5.7.0)

## Providers

The following providers are used by this module:

- github (~> 5.7.0)

## Modules

The following Modules are called:

### validation

Source: ./modules/validation

Version:

## Resources

The following resources are used by this module:

- [github_branch.branches](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch) (resource)
- [github_branch.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch) (resource)
- [github_branch_default.instance](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default) (resource)
- [github_branch_protection.instance](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection) (resource)
- [github_repository.instance](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) (resource)

## Required Inputs

The following input variables are required:

### name

Description: Name of the repository.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### allow\_auto\_merge

Description: (Optional) Set to true to allow auto-merging pull requests on the repository. If enabled for a pull request, the pull request will merge automatically when all required reviews are met and status checks have passed. (Default: `false`)

Type: `bool`

Default: `null`

### allow\_merge\_commit

Description: (Optional) Set to false to disable merge commits on the repository. (Default: `true`)

Type: `bool`

Default: `null`

### allow\_rebase\_merge

Description: (Optional) Set to true to enable rebase merges on the repository. (Default: `false`)

Type: `bool`

Default: `null`

### allow\_squash\_merge

Description: (Optional) Set to true to enable squash merges on the repository. (Default: `false`)

Type: `bool`

Default: `null`

### allow\_update\_branch

Description: (Optional) Set to true to always suggest updating pull request branches.

Type: `bool`

Default: `null`

### archive\_on\_destroy

Description: (Optional) Set to true to enable archiving on delete. (Default: `true`).

Type: `string`

Default: `null`

### archived

Description: (Optional) Specifies if the repository should be archived. (Default: `false`)

Type: `bool`

Default: `false`

### auto\_init

Description: (Optional) Whether or not to produce an initial commit in the repository. (Default: `true`)

Type: `bool`

Default: `null`

### branch\_protections

Description: (Optional) A list of branch protections to apply to the repository. (Default: `[]`)

Type:

```hcl
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
```

Default: `null`

### branches

Description: (Optional) List of branches to be created in the repository. (Default: `[]`)

Type:

```hcl
list(
    object({
      name          = string
      source_branch = optional(string)
      source_sha    = optional(string)
    })
  )
```

Default: `null`

### create\_default\_branch

Description: (Optional) This can only be set after a repository has already been created and the branch has been created in the repository.  By default the default branch will be created when the repository is created. (Default: `true`)

Type: `bool`

Default: `null`

### default\_branch

Description: (Optional) The name of the default branch of the repository. (Default: `main`)

Type: `string`

Default: `null`

### defaults

Description: (Optional) Defaults for optional repository settings.

Type:

```hcl
object({
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
          allow_deletiona    = optional(bool, false)
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
```

Default: `{}`

### delete\_branch\_on\_merge

Description: (Optional) Whether or not to delete the merged branch after merging a pull request. (Default: `false`)

Type: `bool`

Default: `null`

### description

Description: (Optional) Short description of the repository. (Default: `""`)

Type: `string`

Default: `""`

### extra\_branch\_protections

Description: (Optional) An extra list of branch protections to apply to the repository. (Default: `[]`)

Type:

```hcl
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
  )
```

Default: `[]`

### extra\_branches

Description: (Optional) Extra list of branches to be created in the repository. (Default: `[]`)

Type:

```hcl
list(
    object({
      name          = string
      source_branch = optional(string)
      source_sha    = optional(string)
    })
  )
```

Default: `[]`

### extra\_permisisons\_by\_team

Description: (Optional) Extra list of teams and permissions. (Default: `[]`)

Type:

```hcl
list(
    object({
      team_id    = string
      permission = string
    })
  )
```

Default: `[]`

### extra\_permissions\_by\_collaborator

Description: (Optional) Extra list of collaborators and permissions. (Default: `[]`)

Type:

```hcl
list(
    object({
      username   = string
      permission = string
    })
  )
```

Default: `[]`

### extra\_topics

Description: (Optional) Extra list of topics of the repository.  (Default: `[]`)

Type: `list(string)`

Default: `null`

### gitignore\_template

Description: (Optional) Use the name of the template without the extension. For example, `python`. Available templates: https://github.com/github/gitignore. (Default: `null`)

Type: `string`

Default: `null`

### has\_issues

Description: (Optional) Set to true to enable the GitHub Issues features on the repository. (Default: `false`)

Type: `bool`

Default: `null`

### has\_projects

Description: (Optional) Set to true to enable the GitHub Projects features on the repository. If you specify true when it has been disabled in an organization it will return an error.  (Default: `false`)

Type: `bool`

Default: `null`

### has\_wiki

Description: (Optional) Set to true to enable the GitHub Wiki features on the repository. (Default: `false`)

Type: `bool`

Default: `null`

### homepage\_url

Description: (Optional) The website url of the repository. (Default: `null`)

Type: `string`

Default: `null`

### ignore\_vulnerability\_alerts\_during\_read

Description: (Optional) Set to true to not call the vulnerability alerts endpoint so the resource can also be used without admin permissions during read. (Default: `false`)

Type: `bool`

Default: `null`

### is\_template

Description: (Optional) Whether or not this is a template repository. (Default: `false`)

Type: `bool`

Default: `null`

### license\_template

Description: (Optional) Use the name of the template without the extension. For example, `mit` or `apache-2.0`. Available licences: https://github.com/github/choosealicense.com/tree/gh-pages/_licenses. (Default: `null`)

Type: `string`

Default: `null`

### merge\_commit\_message

Description: (Optional) Can be `PR_BODY`, `PR_TITLE`, or `BLAMK`. (Default: `BLANK`)

Type: `string`

Default: `null`

### merge\_commit\_title

Description: (Optional) Can be `PR_TITLE` or `MERGE_MESSAGE`. (Default: `MERGE_MESSAGE`)

Type: `string`

Default: `null`

### pages

Description: (Optional) The repository's GitHub Pages configuration. (Default: `{}`)

Type:

```hcl
list(
    object({
      branch = string
      path   = optional(string)
      cname  = optional(string, "/")
    })
  )
```

Default: `null`

### permisisons\_by\_team

Description: (Optional) List of teams and permissions. (Default: `[]`)

Type:

```hcl
list(
    object({
      team_id    = string
      permission = string
    })
  )
```

Default: `null`

### permissions\_by\_collaborator

Description: (Optional) List of collaborators and permissions. (Default: `[]`)

Type:

```hcl
list(
    object({
      username   = string
      permission = string
    })
  )
```

Default: `null`

### squash\_merge\_commit\_message

Description: (Optional) Can be `PR_BODY`, `COMMIT_MESSAGES`, or `BLANK`. (Default: `BLANK`)

Type: `string`

Default: `null`

### squash\_merge\_commit\_title

Description: (Optional) Can be `PR_TITLE` or `COMMIT_OR_PR_TITLE`. (Default: `COMMIT_OR_PR_TITLE`)

Type: `string`

Default: `null`

### template

Description: (Optional) Template repository to use. (Default: `{}`)

Type:

```hcl
list(
    object({
      owner      = string
      repository = string
    })
  )
```

Default: `null`

### topics

Description: (Optional) The list of topics of the repository.  (Default: `[]`)

Type: `list(string)`

Default: `null`

### visibility

Description: (Optional) Repository visibility.  Valid values are: `private`, `public`, or `internal`. (Default: `private`)

Type: `string`

Default: `null`

### vulnerability\_alerts

Description: (Optional) Set to true to enable security alerts for vulnerable dependencies. (Default: `true`)

Type: `bool`

Default: `null`
<!-- END_TF_DOCS -->
