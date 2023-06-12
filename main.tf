terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "app-ec2" {
    ami = "ami-049a62eb90480f276"
    instance_type = "t2.micro"

    user_data = <<-EOF
        #!/bin/bash
        sudo yum update -y
        sudo yum install docker -y
        sudo service docker start
        sudo usermod -a -G docker ec2-user
    EOF

    tags = {
        Name = "app-ec2"
    }
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_default_security_group" "app-ec2-sg" {
  vpc_id = aws_default_vpc.default.id

  ingress {
    description =  "Port 80 allowed for TCP HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description =  "Port 443 allowed for TCP HTTPS"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description =  "Port 3000 allowed for TCP"
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
        description =  "Port 22 allowed for SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app-ec2-sg"
  }
}
