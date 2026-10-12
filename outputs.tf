output "teams_id" {
  description = "Map of id values across all teams, keyed the same as var.teams except keys with no id are omitted"
  value       = { for k, v in tfe_team.teams : k => v.id if v.id != null && length(v.id) > 0 }
}
output "teams_allow_member_token_management" {
  description = "Map of allow_member_token_management values across all teams, keyed the same as var.teams except keys with no allow_member_token_management are omitted"
  value       = { for k, v in tfe_team.teams : k => v.allow_member_token_management if v.allow_member_token_management != null }
}
output "teams_name" {
  description = "Map of name values across all teams, keyed the same as var.teams except keys with no name are omitted"
  value       = { for k, v in tfe_team.teams : k => v.name if v.name != null && length(v.name) > 0 }
}
output "teams_organization" {
  description = "Map of organization values across all teams, keyed the same as var.teams except keys with no organization are omitted"
  value       = { for k, v in tfe_team.teams : k => v.organization if v.organization != null && length(v.organization) > 0 }
}
output "teams_organization_access" {
  description = "Map of organization_access values across all teams, keyed the same as var.teams except keys with no organization_access are omitted"
  value       = { for k, v in tfe_team.teams : k => one(v.organization_access) if v.organization_access != null && length(v.organization_access) > 0 }
}
output "teams_sso_team_id" {
  description = "Map of sso_team_id values across all teams, keyed the same as var.teams except keys with no sso_team_id are omitted"
  value       = { for k, v in tfe_team.teams : k => v.sso_team_id if v.sso_team_id != null && length(v.sso_team_id) > 0 }
}
output "teams_visibility" {
  description = "Map of visibility values across all teams, keyed the same as var.teams except keys with no visibility are omitted"
  value       = { for k, v in tfe_team.teams : k => v.visibility if v.visibility != null && length(v.visibility) > 0 }
}

