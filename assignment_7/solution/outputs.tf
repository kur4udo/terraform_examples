# Exercise 7 - Modules
# outputs.tf

output load_balancer_dns {
  value = module.compute.load_balancer_dns
}