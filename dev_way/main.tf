
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "dev_way" {
  ami           = "ami-0195204d5dce06d99"
  instance_type = "t2.micro"

  # Giving the instance a name
  tags = {
    Name = "devWay"
  }
}