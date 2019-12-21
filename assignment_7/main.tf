# Exercise 7 - Modules
# main.tf

provider "aws" {
  region = var.region
}

module "compute" {
  source = "./compute"
}