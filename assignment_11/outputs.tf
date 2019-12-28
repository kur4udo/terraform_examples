# Exercise 11 - Route 53
# outputs.tf

output load_balancer_dns {
  value = module.compute.load_balancer_dns
}

## Add output for aws_route53_record fqdn attribute