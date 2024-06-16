### ADDING ORGANIZATION NAME TO TERRAFORM ###
terraform {
  cloud {
    organization = "Adnan_Home_Corp"
    workspaces {
      name = "practice-aws-home"
    }
  }
}

### TERRAFORM CONFIG ###
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

### PROVIDERS ###
provider "aws" {
  region = "us-east-1"
}

### RESOURCES WITH TAGS ###
resource "aws_instance" "practice_server" {
  ami           = "ami-0069eac59d05ae12b"
  instance_type = "t2.micro"

### Adding name tags ###
  tags = {
    Name = var.instance_name
  }
}



