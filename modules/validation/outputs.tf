output "allow_auto_merge" {
  description = "(Optional) Set to true to allow auto-merging pull requests on the repository. If enabled for a pull request, the pull request will merge automatically when all required reviews are met and status checks have passed. (Default: `false`)"
  value       = var.allow_auto_merge
}

output "allow_merge_commit" {
  description = "(Optional) Set to false to disable merge commits on the repository. (Default: `true`)"
  value       = var.allow_merge_commit
}

output "allow_rebase_merge" {
  description = "(Optional) Set to true to enable rebase merges on the repository. (Default: `false`)"
  value       = var.allow_rebase_merge
}

output "allow_squash_merge" {
  description = "(Optional) Set to true to enable squash merges on the repository. (Default: `false`)"
  value       = var.allow_squash_merge
}

output "archive_on_destroy" {
  description = "(Optional) Set to true to enable archiving on delete. (Default: `true`)."
  value       = var.archive_on_destroy
}

output "archived" {
  description = "(Optional) Specifies if the repository should be archived. (Default: `false`)"
  value       = var.archived
}

output "auto_init" {
  description = "(Optional) Whether or not to produce an initial commit in the repository. (Default: `true`)"
  value       = var.auto_init
}

output "branch_protections" {
  description = "(Optional) A list of branch protections to apply to the repository. (Default: `[]`)"
  value       = var.branch_protections
}

output "branches" {
  description = "(Optional) List of branches to be created in the repository. (Default: `[]`)"
  value       = var.branches
}

output "create_value_branch" {
  description = "(Optional) This can only be set after a repository has already been created and the branch has been created in the repository.  By default the default branch will be created when the repository is created. (Default: `true`)"
  value       = var.create_default_branch
}

output "default_branch" {
  description = "(Optional) The name of the default branch of the repository. (Default: `main`)"
  value       = var.default_branch
}

output "delete_branch_on_merge" {
  description = "(Optional) Whether or not to delete the merged branch after merging a pull request. (Default: `false`)"
  value       = var.delete_branch_on_merge
}

output "gitignore_template" {
  description = "(Optional) Use the name of the template without the extension. For example, `python`. Available templates: https://github.com/github/gitignore. (Default: `null`)"
  value       = var.gitignore_template
}

output "has_issues" {
  description = "(Optional) Set to true to enable the GitHub Issues features on the repository. (Default: `false`)"
  value       = var.has_issues
}

output "has_projects" {
  description = "(Optional) Set to true to enable the GitHub Projects features on the repository. If you specify true when it has been disabled in an organization it will return an error.  (Default: `false`)"
  value       = var.has_projects
}

output "has_wiki" {
  description = "(Optional) Set to true to enable the GitHub Wiki features on the repository. (Default: `false`)"
  value       = var.has_wiki
}

output "homepage_url" {
  description = "(Optional) The website url of the repository. (Default: `null`)"
  value       = var.homepage_url
}

output "ignore_vulnerability_alerts_during_read" {
  description = "(Optional) Set to true to not call the vulnerability alerts endpoint so the resource can also be used without admin permissions during read. (Default: `false`)"
  value       = var.ignore_vulnerability_alerts_during_read
}

output "is_template" {
  description = "(Optional) Whether or not this is a template repository. (Default: `false`)"
  value       = var.is_template
}

output "license_template" {
  description = "(Optional) Use the name of the template without the extension. For example, `mit` or `apache-2.0`. Available licences: https://github.com/github/choosealicense.com/tree/gh-pages/_licenses. (Default: `null`)"
  value       = var.license_template
}

output "merge_commit_message" {
  description = "(Optional) Can be `PR_BODY`, `PR_TITLE`, or `BLAMK`. (Default: `BLANK`)"
  value       = var.merge_commit_message
}

output "merge_commit_title" {
  description = "(Optional) Can be `PR_TITLE` or `MERGE_MESSAGE`. (Default: `MERGE_MESSAGE`)"
  value       = var.merge_commit_title
}

output "pages" {
  description = "(Optional) The repository's GitHub Pages configuration. (Default: `{}`)"
  value       = var.pages
}

output "permissions_by_collaborator" {
  description = "(Optional) List of collaborators and permissions. (Default: `[]`)"
  value       = var.permissions_by_collaborator
}

output "permisisons_by_team" {
  description = "(Optional) List of teams and permissions. (Default: `[]`)"
  value       = var.permisisons_by_team
}

output "squash_merge_commit_message" {
  description = "(Optional) Can be `PR_BODY`, `COMMIT_MESSAGES`, or `BLANK`. (Default: `BLANK`)"
  value       = var.squash_merge_commit_message
}

output "squash_merge_commit_title" {
  description = "(Optional) Can be `PR_TITLE` or `COMMIT_OR_PR_TITLE`. (Default: `COMMIT_OR_PR_TITLE`)"
  value       = var.squash_merge_commit_title
}

output "template" {
  description = "(Optional) Template repository to use. (Default: `{}`)"
  value       = var.template
}

output "topics" {
  description = "(Optional) The list of topics of the repository.  (Default: `[]`)"
  value       = var.topics
}

output "visibility" {
  description = "(Optional) Repository visibility.  Valid values are: `private`, `public`, or `internal`. (Default: `private`)"
  value       = var.visibility
}

output "vulnerability_alerts" {
  description = "(Optional) Set to true to enable security alerts for vulnerable dependencies. (Default: `true`)"
  value       = var.vulnerability_alerts
}
