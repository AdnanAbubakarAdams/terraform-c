##############################
###### Store Remote State ####
##############################
terraform {
  cloud {
    organization = "Adnan_Home_Corp"
    workspaces {
      name = "the_remake_space"
    }
  }
}

#############################
##### Terraform Config #####
############################
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

################################
##### configure Providers #####
################################
provider "aws" {
  region = "us-east-1"
}

#################################
###### Configure Resources #####
#################################
resource "aws_instance" "terPrac" {
  ami           = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"

  # Giving the instance a name
  tags = {
    # Name = "terRemake_instance"
    Name = var.instance_name
  }
}