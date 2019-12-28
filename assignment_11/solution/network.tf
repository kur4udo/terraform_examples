# Exercise 11 - Route 53
# network.tf

## VPC

resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "Default VPC"
  }
}

## Route53

resource "aws_route53_zone" "r53_zone" {
  name              = "${var.domain_name}.tk"
  delegation_set_id = var.delegation_set
}

resource "aws_route53_record" "web_subdomain" {
  name = "web.${var.domain_name}.tk"
  type = "A"  

  zone_id = aws_route53_zone.r53_zone.id

  alias {
    name                   = module.compute.load_balancer_dns
    zone_id                = module.compute.load_balancer_zone_id
    evaluate_target_health = false
  }
}