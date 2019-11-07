# Exercise 2.1 - Providers
# main.tf

provider "aws" {
  region = "eu-west-1"
}

provider "azurerm" {
  version = "=1.34.0"
}

provider "google" {
  region = "us-central1"
}

provider "docker" {
  host = "tcp://127.0.0.1:2376/"
}

provider "kubernetes" {
  host = "https://localhost"
}