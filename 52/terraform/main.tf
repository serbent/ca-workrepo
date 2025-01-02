provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "legacy_ec2_app_01" {
    ami = "ami-0e54671bdf3c8ed8d"
    instance_type = "t2.micro"
    tags                                 = {
        "environment" = "test"
        "name"        = "code-academy-01"
        }
      tags_all                             = {
        "environment" = "test"
        "name"        = "code-academy-01"
        }
}