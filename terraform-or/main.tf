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
  ami                    = "ami-04b70fa74e45c3917"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.for_or_server.id}"]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  ### Name tags added ###
  tags = {
    Name = "new_h_server"
  }
}

### Creating a Security-Group Resource ###
resource "aws_security_group" "for_or_server" {
  name = "or_practice_home"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
