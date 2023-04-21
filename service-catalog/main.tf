terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-00d4ad33aaf7045d7"
  instance_type = "t4g.nano"

  tags = {
    Name = "GravitonServerWithAmazonLinux2023"
  }
}
