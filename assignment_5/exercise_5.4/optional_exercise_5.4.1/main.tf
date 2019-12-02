# Exercise 5.4.1 - Application Load Balancer - advanced exercise
# main.tf

provider "aws" {
  region = "eu-west-1"
}

## Data

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm*-x86_64-gp2"]
  }
}

data "template_file" "web_server_template" {
  template = "${file("${path.module}/web_server.tpl")}"
}

## Add aws_availability_zones data - https://www.terraform.io/docs/providers/aws/d/availability_zones.html


## VPC

resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "Default VPC"
  }
}

## Availability zones

## Add aws_default_subnet resource - https://www.terraform.io/docs/providers/aws/r/default_subnet.html
# - use count and length function to get all aws_availability_zones
# - use count.index to assign value to availability_zone


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
  count = length(var.number_of_instances)
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.sg.id]

  key_name = aws_key_pair.ec2_key.id

  user_data = data.template_file.web_server_template.rendered

  tags = {
    Name = "EC2 created by Terraform"
  }  
}

## Public key

resource "aws_key_pair" "ec2_key" {
  key_name   = "Terraform training"
  public_key = "ssh-rsa ..."
}

## ELB

## Add aws_lb resource - https://www.terraform.io/docs/providers/aws/r/lb.html


## Listener

## Add aws_lb_listener - https://www.terraform.io/docs/providers/aws/r/lb_listener.html


## Target group

## Add aws_lb_target_group resource - https://www.terraform.io/docs/providers/aws/r/lb_target_group.html


## Target group and load balancer attachment

## Add aws_lb_target_group_attachment resource - https://www.terraform.io/docs/providers/aws/r/lb_target_group_attachment.html
# - use count to assign instances


## Outputs

## Add output for aws_lb dns_name attribute
