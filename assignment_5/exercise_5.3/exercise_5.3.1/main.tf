# Exercise 5.3.1 - User data
# main.tf

provider "aws" {
  region = "eu-west-1"
}

## Data

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners = ["amazon"]
  
  filter {
    name = "name"
    values = ["amzn-ami-hvm*-x86_64-gp2"]
  }  
}

## VPC

resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "Default VPC"
  }
}

## Security group

resource "aws_security_group" "sg" {
  name        = "SSH access security group"
  description = "Security group created by Terraform"
  vpc_id      = aws_default_vpc.default_vpc.id

  ingress {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ## Add ingress rule for http tcp port 80

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }  
}

## EC2

resource "aws_instance" "server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.sg.id]

  key_name = aws_key_pair.ec2_key.id  

  tags = {
    Name = "EC2 created by Terraform"
  }

  ## Add user_data and use HereDoc with commands for bash script:
  # - installing httpd
  # - creating simple index.html file in /var/www/html
  # - starting httpd
   
}

## Public key

resource "aws_key_pair" "ec2_key" {
  key_name = "Terraform training"
  public_key = "ssh-rsa ..."
}
