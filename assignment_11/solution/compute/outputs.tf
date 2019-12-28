# Exercise 11 - Route 53
# compute/outputs.tf

output load_balancer_dns {
  value = aws_elb.load_balancer.dns_name
}

output load_balancer_zone_id {
  value = aws_elb.load_balancer.zone_id
}