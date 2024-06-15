### Config ####
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

### Providers ###
provider "aws" {
  region = "us-east-1"
}
############################
### Resources with Tags ### 
###########################
resource "aws_instance" "or_server" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"

  tags = {
    Name = "new_h_server"
  }
}
