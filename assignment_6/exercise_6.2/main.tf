# Exercise 6.2 - Splitting code - rest of content
# main.tf

provider "aws" {
  region = var.region
}

## Data

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = [var.ami_owner]

  filter {
    name   = "name"
    values = [var.ami_image]
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

    from_port   = var.ingress_ports[0]
    to_port     = var.ingress_ports[0]
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {

    from_port   = var.ingress_ports[1]
    to_port     = var.ingress_ports[1]
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
  count = var.servers_count
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.sg.id]

  key_name = aws_key_pair.ec2_key.id

  user_data = file("web_server.tpl")

  tags = {
    Name = "EC2 created by Terraform"
  }
}

## Public key

resource "aws_key_pair" "ec2_key" {
  key_name   = "Terraform training"
  public_key = var.public_key
}

## ELB

resource "aws_elb" "load_balancer" {
  name               = "tf-training-elb"
  availability_zones = var.availability_zones

  listener {
    instance_port     = var.listener_ports["instance_port"]
    instance_protocol = "http"
    lb_port           = var.listener_ports["lb_port"]
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 10
  }
  
  instances                   = aws_instance.server[*].id
  cross_zone_load_balancing   = true  

  tags = {
    Name = "ELB for web servers"
  }
}

## Outputs

output load_balancer_dns {
  value = aws_elb.load_balancer.dns_name
}