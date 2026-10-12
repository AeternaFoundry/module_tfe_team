variable "teams" {
  description = <<EOT
Map of teams, attributes below
Required:
    - name
Optional:
    - allow_member_token_management
    - organization
    - sso_team_id
    - visibility
    - organization_access (block):
        - access_secret_teams (optional)
        - delegate_policy_overrides (optional)
        - manage_agent_pools (optional)
        - manage_membership (optional)
        - manage_modules (optional)
        - manage_organization_access (optional)
        - manage_policies (optional)
        - manage_policy_overrides (optional)
        - manage_projects (optional)
        - manage_providers (optional)
        - manage_run_tasks (optional)
        - manage_teams (optional)
        - manage_vcs_settings (optional)
        - manage_workspaces (optional)
        - read_projects (optional)
        - read_workspaces (optional)
EOT

  type = map(object({
    name                          = string
    allow_member_token_management = optional(bool)
    organization                  = optional(string)
    sso_team_id                   = optional(string)
    visibility                    = optional(string)
    organization_access = optional(object({
      access_secret_teams        = optional(bool)
      delegate_policy_overrides  = optional(bool)
      manage_agent_pools         = optional(bool)
      manage_membership          = optional(bool)
      manage_modules             = optional(bool)
      manage_organization_access = optional(bool)
      manage_policies            = optional(bool)
      manage_policy_overrides    = optional(bool)
      manage_projects            = optional(bool)
      manage_providers           = optional(bool)
      manage_run_tasks           = optional(bool)
      manage_teams               = optional(bool)
      manage_vcs_settings        = optional(bool)
      manage_workspaces          = optional(bool)
      read_projects              = optional(bool)
      read_workspaces            = optional(bool)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.teams : (
        v.visibility == null || (contains(["secret", "organization"], v.visibility))
      )
    ])
    error_message = "must be one of: \"secret\", \"organization\""
  }
}

