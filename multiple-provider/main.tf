terraform {
  required_providers {
    aws = {
      source  = "opentofu/aws"
      version = ">= 4.0.0"
    }
    awscc = {
      source  = "opentofu/awscc"
      version = "1.35.0"
    }
  }
  required_version = ">= 1.0.0"
}

resource "awscc_ec2_key_pair" "this" {
  key_name   = "tmp"
  key_format = "pem"
  key_type   = "rsa"
}

resource "aws_instance" "this" {
  ami           = "ami-05506fa68391b4cb1" # AL 2023
  instance_type = "t3.micro"
  key_name      = awscc_ec2_key_pair.this.key_name
}
