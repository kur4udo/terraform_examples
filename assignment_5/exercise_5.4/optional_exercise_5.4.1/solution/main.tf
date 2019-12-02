# Exercise 5.3.2 - Application Load Balancer - advanced exercise - example solution
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

data "aws_availability_zones" "available_zones" {
  state = "available"
}

## VPC

resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "Default VPC"
  }
}

## Availability zones

resource "aws_default_subnet" "default_subnets" {
  count = length(data.aws_availability_zones.available_zones.names)
  availability_zone = data.aws_availability_zones.available_zones.names[count.index]

  tags = {
    Name = "Default subnet for ${data.aws_availability_zones.available_zones.names[count.index]}"
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
  public_key = "..."
}

## ELB

resource "aws_lb" "load_balancer" {
  name               = "tf-training-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg.id]
  subnets            = aws_default_subnet.default_subnets[*].id
  #subnets            = tolist(aws_default_subnet.default_subnets[*].id)  

  tags = {
    Environment = "training"
  }
}

## Listener

resource "aws_lb_listener" "load_balancer_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"  

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.load_balancer_tg.arn
  }
}

## Target group

resource "aws_lb_target_group" "load_balancer_tg" {
  name     = "tf-training-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_default_vpc.default_vpc.id
}

## Target group and load balancer attachment

resource "aws_lb_target_group_attachment" "load_balancer_tg_attach" {

  count = 2
  
  target_group_arn = aws_lb_target_group.load_balancer_tg.arn
  target_id        = aws_instance.server[count.index].id
  port             = 80
}

## Outputs

output load_balancer_dns {
  value = aws_lb.load_balancer.dns_name
}
