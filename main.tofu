terraform {
  backend "consul" {
    address = "tsuro.wahoo-monster.ts.net:8500"
    scheme  = "http"
    path    = "terraform/archessmn/dns"
    lock    = true
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

provider "cloudflare" {}
