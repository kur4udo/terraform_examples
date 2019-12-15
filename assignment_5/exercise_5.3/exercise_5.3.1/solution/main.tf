# Exercise 5.3.1 - User data - example solution
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
  name        = "SSH access and HTTP security group"
  description = "Security group created by Terraform"
  vpc_id      = aws_default_vpc.default_vpc.id

  ingress {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {

    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  

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

  user_data = <<-USERDATA
  #!/bin/bash
  yum install -y httpd
  web_server_hostname=`hostname`
  echo "<h1>Web server $web_server_hostname</h1>" >> /var/www/html/index.html
  service httpd start
  chkconfig httpd on
  USERDATA
}

## Public key

resource "aws_key_pair" "ec2_key" {
  key_name = "Terraform training"
  public_key = "ssh-rsa ..."
}
