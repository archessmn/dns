locals {
  zone_id = "fbb0d324d677c263c484a1fadf865b20"

  records = {
    cname = {
      org_eduwoem_dev_wildcard = {
        content = "eduwoem.org"
        name    = "*.dev.eduwoem.org"
      }
      org_eduwoem_wildcard = {
        content = "eduwoem.org"
        name    = "*.eduwoem.org"
      }
      org_eduwoem = {
        content = "host.moir.xyz"
        name    = "eduwoem.org"
      }
      org_eduwoem__domainkey_sig1 = {
        content = "sig1.dkim.eduwoem.org.at.icloudmailadmin.com"
        name    = "sig1._domainkey.eduwoem.org"
      }
    }

    mx = {
      org_eduwoem_1 = {
        content  = "mx01.mail.icloud.com"
        name     = "eduwoem.org"
        priority = 10
      }
      org_eduwoem_2 = {
        content  = "mx02.mail.icloud.com"
        name     = "eduwoem.org"
        priority = 10
      }
    }

    srv = {
      org_eduwoem__tcp__minecraft = {
        name = "_minecraft._tcp.eduwoem.org"
        data = {
          port     = 25565
          priority = 0
          target   = "host.moir.xyz"
          weight   = 0
        }
      }

      org_eduwoem_yapp__tcp__minecraft = {
        name = "_minecraft._tcp.yapp.eduwoem.org"
        data = {
          port     = 25503
          priority = 0
          target   = "host.moir.xyz"
          weight   = 0
        }
      }
    }

    txt = {
      org_eduwoem__dmarc = {
        name    = "_dmarc.eduwoem.org"
        content = "\"v=DMARC1; p=none; rua=mailto:fa67c3c4d8754524827f8a9a4108750e@dmarc-reports.cloudflare.net\""
      }

      org_eduwoem_1 = {
        name    = "eduwoem.org"
        content = "\"apple-domain=17czukQ6Hq8O8qmq\""
        ttl     = 3600
      }

      org_eduwoem_2 = {
        name    = "eduwoem.org"
        content = "\"v=spf1 include:icloud.com ~all\""
        ttl     = 3600
      }
    }
  }
}

resource "cloudflare_dns_record" "org_eduwoem_records_cname" {
  for_each = local.records.cname

  name    = each.value.name
  content = each.value.content

  proxied  = false
  ttl      = 1
  type     = "CNAME"
  zone_id  = local.zone_id
  settings = {}
  comment  = var.dns_record_comment
}

resource "cloudflare_dns_record" "org_eduwoem_records_mx" {
  for_each = local.records.mx

  name     = each.value.name
  content  = each.value.content
  priority = each.value.priority

  proxied  = false
  ttl      = 3600
  type     = "MX"
  zone_id  = local.zone_id
  settings = {}
  comment  = var.dns_record_comment
}

resource "cloudflare_dns_record" "org_eduwoem_records_srv" {
  for_each = local.records.srv

  name     = each.value.name
  priority = 0
  proxied  = false
  tags     = []
  ttl      = 1
  type     = "SRV"
  zone_id  = local.zone_id
  data     = each.value.data
  settings = {}
  comment  = var.dns_record_comment
}

resource "cloudflare_dns_record" "org_eduwoem_records_txt" {
  for_each = local.records.txt

  name     = each.value.name
  content  = each.value.content
  proxied  = false
  tags     = []
  ttl      = try(each.value.ttl, 1)
  type     = "TXT"
  zone_id  = local.zone_id
  settings = {}
  comment  = var.dns_record_comment
}
