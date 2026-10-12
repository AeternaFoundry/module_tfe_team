resource "tfe_team" "teams" {
  for_each = var.teams

  name                          = each.value.name
  allow_member_token_management = each.value.allow_member_token_management
  organization                  = each.value.organization
  sso_team_id                   = each.value.sso_team_id
  visibility                    = each.value.visibility

  dynamic "organization_access" {
    for_each = each.value.organization_access != null ? [each.value.organization_access] : []
    content {
      access_secret_teams        = organization_access.value.access_secret_teams
      delegate_policy_overrides  = organization_access.value.delegate_policy_overrides
      manage_agent_pools         = organization_access.value.manage_agent_pools
      manage_membership          = organization_access.value.manage_membership
      manage_modules             = organization_access.value.manage_modules
      manage_organization_access = organization_access.value.manage_organization_access
      manage_policies            = organization_access.value.manage_policies
      manage_policy_overrides    = organization_access.value.manage_policy_overrides
      manage_projects            = organization_access.value.manage_projects
      manage_providers           = organization_access.value.manage_providers
      manage_run_tasks           = organization_access.value.manage_run_tasks
      manage_teams               = organization_access.value.manage_teams
      manage_vcs_settings        = organization_access.value.manage_vcs_settings
      manage_workspaces          = organization_access.value.manage_workspaces
      read_projects              = organization_access.value.read_projects
      read_workspaces            = organization_access.value.read_workspaces
    }
  }
}

