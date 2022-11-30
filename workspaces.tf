##################################################################
# aws cli command for bundle options
# "aws workspaces describe-workspace-bundles --owner AMAZON"
# This is a Windows Standard Bundle


data "aws_workspaces_bundle" "standard_windows" {
  bundle_id = "wsb-gk1wpk43z"
}



##################################################################

resource "aws_workspaces_workspace" "workspaces" {
  directory_id = aws_workspaces_directory.workspaces-directory.id
  bundle_id    = data.aws_workspaces_bundle.standard_windows.id
  # Admin is the Administrator of the AWS Directory Service
  user_name = "Admin"
  workspace_properties {
    compute_type_name                         = "STANDARD" # compute_type_name is the compute bundle type.
    user_volume_size_gib                      = 50
    root_volume_size_gib                      = 80
    running_mode                              = "AUTO_STOP"
    running_mode_auto_stop_timeout_in_minutes = 60
  }
  tags = {
    Name        = "demo-workspaces"
    Environment = "dev"
  }
  depends_on = [
    aws_iam_role.workspaces-default,
    aws_workspaces_directory.workspaces-directory
  ]
}