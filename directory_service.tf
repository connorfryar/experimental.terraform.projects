resource "aws_directory_service_directory" "aws-managed-ad" {
  name = "kopicloud.local"
  description = "KopiCloud Managed Directory Service"
  password = "Sup3rS3cr3tP@ssw0rd"
  edition = "Standard"
  type = "MicrosoftAD"
  vpc_settings {
    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnets
  }
  tags = {
    Name = "kopicloud-managed-ad"
    Environment = "Development"
  }
}