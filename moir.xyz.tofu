locals {
  xyz_moir_zone_id = "9dd1263c0b1bda5a8d379c457da68fc3"

  xyz_moir_records = {
    a = {}

    aaaa = {}

    cname = {
      xyz_moir_wildcard = {
        name    = "*.moir.xyz"
        content = "temjin.infra.archess.mn"
      }
      xyz_moir_vault = {
        name    = "vault.moir.xyz"
        content = "tsuro.infra.archess.mn"
      }
    }

    srv = {}

    txt = {}
  }
}

resource "cloudflare_dns_record" "xyz_moir_records_a" {
  for_each = local.xyz_moir_records.a

  name    = each.value.name
  content = each.value.content

  proxied  = false
  tags     = []
  ttl      = 1
  type     = "A"
  zone_id  = local.xyz_moir_zone_id
  settings = {}
  comment  = var.dns_record_comment
}


resource "cloudflare_dns_record" "xyz_moir_records_aaaa" {
  for_each = local.xyz_moir_records.aaaa

  name    = each.value.name
  content = each.value.content

  proxied  = false
  tags     = []
  ttl      = 1
  type     = "AAAA"
  zone_id  = local.xyz_moir_zone_id
  settings = {}
  comment  = var.dns_record_comment
}

resource "cloudflare_dns_record" "xyz_moir_records_cname" {
  for_each = local.xyz_moir_records.cname

  name    = each.value.name
  content = each.value.content

  proxied  = false
  tags     = []
  ttl      = 1
  type     = "CNAME"
  zone_id  = local.xyz_moir_zone_id
  settings = {}
  comment  = var.dns_record_comment
}

resource "cloudflare_dns_record" "xyz_moir_records_srv" {
  for_each = local.xyz_moir_records.srv

  name     = each.value.name
  priority = 0
  proxied  = false
  tags     = []
  ttl      = 1
  type     = "SRV"
  zone_id  = local.xyz_moir_zone_id
  data     = each.value.data
  settings = {}
  comment  = var.dns_record_comment
}

resource "cloudflare_dns_record" "xyz_moir_records_txt" {
  for_each = local.xyz_moir_records.txt

  name    = each.value.name
  content = each.value.content

  proxied  = false
  tags     = []
  ttl      = 1
  type     = "TXT"
  zone_id  = local.xyz_moir_zone_id
  settings = {}
  comment  = var.dns_record_comment
}
