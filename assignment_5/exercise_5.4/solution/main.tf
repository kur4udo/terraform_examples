# Exercise 5.4 - Clasic Load Balancer - example solution
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
  count = 2
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

resource "aws_elb" "load_balancer" {
  name               = "tf-training-elb"
  availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
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