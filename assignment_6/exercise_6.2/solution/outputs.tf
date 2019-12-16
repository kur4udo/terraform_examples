# Exercise 6.2 - Splitting code - rest of content
# outputs.tf

output load_balancer_dns {
  value = aws_elb.load_balancer.dns_name
}