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

## EC2 - comment or remove EC2 definition

resource "aws_instance" "server" {
  count = var.servers_count
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.sg.id]

  key_name = aws_key_pair.ec2_key.id

  user_data = file("${path.module}/web_server.tpl")

  tags = {
    Name = "EC2 created by Terraform"
  }
}

## Public key

resource "aws_key_pair" "ec2_key" {
  key_name   = "Terraform training"
  public_key = var.public_key
}

# Launch configuration
# Create aws_launch_configuration resource with:
# - image_id
# - instance_type
# - user_data
# - security_groups
# - key_name

# Autoscaling group
# Create aws_autoscaling_group resource with:
# - min_size - as a value use var.servers_count
# - max_size - as a value use var.servers_count
# - health_check_type ("ELB")
# - launch_configuration
# - load_balancers
# - availability_zones