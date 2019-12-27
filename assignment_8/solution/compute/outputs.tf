# Exercise 8 - Autoscaling
# compute/outputs.tf

output load_balancer_dns {
  value = aws_elb.load_balancer.dns_name
}