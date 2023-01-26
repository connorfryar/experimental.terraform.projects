resource "aws_workspaces_directory" "workspaces-directory" {
  directory_id = aws_directory_service_directory.ad.id
  subnet_ids   = aws_subnet.subnet.id
  depends_on   = [aws_iam_role.workspaces-default]
}