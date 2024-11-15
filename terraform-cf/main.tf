##### configuration #####
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

#### providers ####
provider "cloudflare" {
  api_token = ""
}

variable "zone_id" {
  default = ""
}

variable "account_id" {
  default = ""
}

variable "domain" {
  default = ""
}

resource "cloudflare" "www" {
  zone_id = var.zone_id
  name    = "www"
  value   = "203.0.113.10"
  type    = "A"
  proxied = true
}
