# Exercise 11 - Route 53
# outputs.tf

output load_balancer_dns {
  value = module.compute.load_balancer_dns
}

output web_server_address {
  value = aws_route53_record.web_subdomain.fqdn
}