# Exercise 7 - Modules
# loadBalancer.tf

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