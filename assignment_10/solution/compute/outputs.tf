# Exercise 10 - Workspaces
# compute/outputs.tf

output load_balancer_dns {
  value = aws_elb.load_balancer.dns_name
}