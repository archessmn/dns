locals {
  org_eduwoem_zone_id = "eduwoem.org."

  org_eduwoem_records = {
    alias = {
      org_eduwoem = {
        name    = "eduwoem.org."
        content = "temjin.infra.archess.mn."
      }

      org_eduwoem_git = {
        name    = "git.eduwoem.org."
        content = "amy.net.isnt-a.top."
      }
    }
    cname = {
      org_eduwoem_dev_wildcard = {
        name    = "*.dev.eduwoem.org."
        content = "eduwoem.org."
      }
      org_eduwoem_wildcard = {
        name    = "*.eduwoem.org."
        content = "eduwoem.org."
      }
      org_eduwoem__domainkey_sig1 = {
        name    = "sig1._domainkey.eduwoem.org."
        content = "sig1.dkim.eduwoem.org.at.icloudmailadmin.com."
      }
    }

    mx = {
      org_eduwoem = {
        name = "eduwoem.org."
        records = [
          {
            server   = "mx01.mail.icloud.com."
            priority = 10
          },
          {
            server   = "mx02.mail.icloud.com."
            priority = 10
          }
        ]
      }
    }

    srv = {
      org_eduwoem_gay__tcp__minecraft = {
        name = "_minecraft._tcp.gay.eduwoem.org."
        data = {
          port     = 25565
          priority = 0
          weight   = 0
          target   = "temjin.infra.archess.mn."
        }
      }
    }

    txt = {
      org_eduwoem__dmarc = {
        name    = "_dmarc.eduwoem.org."
        content = "\"v=DMARC1; p=none; rua=mailto:fa67c3c4d8754524827f8a9a4108750e@dmarc-reports.cloudflare.net\""
      }

      org_eduwoem = {
        name = "eduwoem.org."
        records = [
          "\"apple-domain=17czukQ6Hq8O8qmq\"",
          "\"v=spf1 include:icloud.com ~all\""
        ]
      }
    }
  }
}

resource "powerdns_record" "org_eduwoem_records_alias" {
  for_each = local.org_eduwoem_records.alias

  zone = local.org_eduwoem_zone_id

  name    = each.value.name
  records = [each.value.content]

  type = "ALIAS"
  ttl  = 3600
}

resource "powerdns_record" "org_eduwoem_records_cname" {
  for_each = local.org_eduwoem_records.cname

  zone = local.org_eduwoem_zone_id

  name    = each.value.name
  records = [each.value.content]

  type = "CNAME"
  ttl  = 3600
}

resource "powerdns_record" "org_eduwoem_records_mx" {
  for_each = local.org_eduwoem_records.mx

  name    = each.value.name
  records = [for i, v in each.value.records : "${v.priority} ${v.server}"]

  ttl  = 3600
  type = "MX"
  zone = local.org_eduwoem_zone_id
}

resource "powerdns_record" "org_eduwoem_records_srv" {
  for_each = local.org_eduwoem_records.srv

  name    = each.value.name
  records = ["${each.value.data.priority} ${each.value.data.weight} ${each.value.data.port} ${each.value.data.target}"]

  ttl  = 60
  type = "SRV"
  zone = local.org_eduwoem_zone_id
}

resource "powerdns_record" "org_eduwoem_records_txt" {
  for_each = local.org_eduwoem_records.txt

  name    = each.value.name
  records = each.value.records

  ttl  = 3600
  type = "TXT"
  zone = local.org_eduwoem_zone_id
}
