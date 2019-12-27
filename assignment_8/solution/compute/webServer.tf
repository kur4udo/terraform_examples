# Exercise 8 - Autoscaling
# compute/webServer.tf

## Data

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = [var.ami_owner]

  filter {
    name   = "name"
    values = [var.ami_image]
  }
}

## Security group

resource "aws_security_group" "sg" {
  name        = "SSH access and HTTP security group"
  description = "Security group created by Terraform"
  vpc_id      = var.vpc_id

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

## Public key

resource "aws_key_pair" "ec2_key" {
  key_name   = "Terraform training"
  public_key = var.public_key
}

# Launch configuration

resource "aws_launch_configuration" "lc" {
  name          = "web_servers"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  user_data = file("${path.module}/web_server.tpl")
  security_groups = [aws_security_group.sg.id]
  key_name = aws_key_pair.ec2_key.id
}

# Autoscaling group

resource "aws_autoscaling_group" "asg" {
  name                      = "web_servers_autoscaling_group"
  min_size                  = var.servers_count
  max_size                  = var.servers_count
  health_check_type         = "ELB"  
  launch_configuration      = aws_launch_configuration.lc.id  
  load_balancers            = [aws_elb.load_balancer.id]
  availability_zones        = var.availability_zones  
}