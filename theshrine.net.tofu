locals {
  net_theshrine_zone_id = "873951c2176f85e524d01ef9461f6890"

  net_theshrine_records = {
    cname = {
      net_theshrine_dev_wildcard = {
        name    = "*.dev.theshrine.net"
        content = "host.moir.xyz"
      }
      net_theshrine__domainkey_sig1 = {
        name    = "sig1._domainkey.theshrine.net"
        content = "sig1.dkim.theshrine.net.at.icloudmailadmin.com"
      }
      net_theshrine_wildcard = {
        name    = "*.theshrine.net"
        content = "theshrine.net"
      }
      net_theshrine = {
        name    = "theshrine.net"
        content = "tsuro.infra.archess.mn"
      }
    }

    mx = {
      net_theshrine_1 = {
        name     = "theshrine.net"
        content  = "mx01.mail.icloud.com"
        priority = 10
      }
      net_theshrine_2 = {
        name     = "theshrine.net"
        content  = "mx02.mail.icloud.com"
        priority = 10
      }
    }

    txt = {
      net_theshrine_spf = {
        name    = "theshrine.net"
        content = "\"v=spf1 include:icloud.com ~all\""
      }
      net_theshrine_apple-domain = {
        name    = "theshrine.net"
        content = "\"apple-domain=HdoKod69dpx9lnyv\""
      }
    }
  }
}

resource "cloudflare_dns_record" "net_theshrine_records_cname" {
  for_each = local.net_theshrine_records.cname

  name    = each.value.name
  content = each.value.content

  proxied  = false
  tags     = []
  ttl      = 1
  type     = "CNAME"
  zone_id  = local.net_theshrine_zone_id
  settings = {}
  comment  = var.dns_record_comment
}

resource "cloudflare_dns_record" "net_theshrine_records_mx" {
  for_each = local.net_theshrine_records.mx

  name     = each.value.name
  content  = each.value.content
  priority = each.value.priority

  proxied  = false
  ttl      = 3600
  type     = "MX"
  zone_id  = local.net_theshrine_zone_id
  settings = {}
  comment  = var.dns_record_comment
}

resource "cloudflare_dns_record" "net_theshrine_records_txt" {
  for_each = local.net_theshrine_records.txt

  name    = each.value.name
  content = each.value.content

  proxied  = false
  tags     = []
  ttl      = 1
  type     = "TXT"
  zone_id  = local.net_theshrine_zone_id
  settings = {}
  comment  = var.dns_record_comment
}
