resource "aws_directory_service_directory" "ad" {
  name        = "workspaces"
  description = "workspaces Managed Directory Service"
  password    = "W0rkSp@c3s#2022!"
  edition     = "Standard"
  type        = "MicrosoftAD"
  vpc_settings {
    vpc_id    = aws_vpc.vpc.id
    subnet_ids = [aws_subnet.subnet.id]
  }
  tags = {
    Name        = "kopicloud-managed-ad"
    Environment = "Development"
  }
}