# Exercise 8 - Auto scaling
# outputs.tf

output load_balancer_dns {
  value = module.compute.load_balancer_dns
}