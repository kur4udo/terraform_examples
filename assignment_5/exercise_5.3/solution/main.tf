# Exercise 5.3 - User data
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
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDTTiZoLzDkruL+aHsx58UslNIzC2oh+2y41KmO9p8/oFScnrxaA8cYAdKnfdwNGwTAiDlyJwSo5riLezLxob47gjYr/g4mPojD9qJ8SzV6GYsOz9loVG3XUs0YjkYupT+egDLEQLt94UzqWxGsXQuc7m99d0XZ/IdNoUcPcQ1hAEXcvzcFV2sb1QeBjZWeCy0eJ4zH0L0LRabfastW3Y2p3vt0BbcJZ30tF1WwC9RfyL7azVGGfITBPy8GgyXZVtsfmD7NmXc44t3hei96hiNlbZYA4H/2mqZSyUw3YjMfiY/okgytmLfteVfT2+o4PcVlAGkJCRz3ftMWv+XMwUot"
}
