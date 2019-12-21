# Exercise 7 - Modules
# compute/outputs.tf

output load_balancer_dns {
  value = aws_elb.load_balancer.dns_name
}