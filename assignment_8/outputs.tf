# Exercise 8 - Autoscaling
# outputs.tf

output load_balancer_dns {
  value = module.compute.load_balancer_dns
}