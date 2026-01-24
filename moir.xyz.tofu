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

      xyz_moir_autoconfig = {
        name    = "autoconfig.moir.xyz"
        content = "autoconfig.migadu.com"
      }
      xyz_moir__domainkey_key1 = {
        name    = "key1._domainkey.moir.xyz"
        content = "key1.moir.xyz._domainkey.migadu.com"
      }
      xyz_moir__domainkey_key2 = {
        name    = "key2._domainkey.moir.xyz"
        content = "key2.moir.xyz._domainkey.migadu.com"
      }
      xyz_moir__domainkey_key3 = {
        name    = "key3._domainkey.moir.xyz"
        content = "key3.moir.xyz._domainkey.migadu.com"
      }
    }

    mx = {
      xyz_moir_1 = {
        name     = "moir.xyz"
        content  = "aspmx1.migadu.com"
        priority = 10
      }
      xyz_moir_wildcard_1 = {
        name     = "*.moir.xyz"
        content  = "aspmx1.migadu.com"
        priority = 10
      }
      xyz_moir_2 = {
        name     = "moir.xyz"
        content  = "aspmx2.migadu.com"
        priority = 20
      }
      xyz_moir_wildcard_2 = {
        name     = "*.moir.xyz"
        content  = "aspmx2.migadu.com"
        priority = 20
      }
    }

    srv = {
      xyz_moir__tcp__submissions = {
        name = "_submissions._tcp.moir.xyz"
        data = {
          port     = 465
          priority = 0
          weight   = 0
          target   = "smtp.migadu.com"
        }
      }
      xyz_moir__tcp__imaps = {
        name = "_imaps._tcp.moir.xyz"
        data = {
          port     = 993
          priority = 0
          weight   = 0
          target   = "imap.migadu.com"
        }
      }
      xyz_moir__tcp__pop3s = {
        name = "_pop3s._tcp.moir.xyz"
        data = {
          port     = 995
          priority = 0
          weight   = 0
          target   = "pop.migadu.com"
        }
      }
    }

    txt = {
      xyz_moir_migadu = {
        name    = "moir.xyz"
        content = "\"hosted-email-verify=rsw3fxij\""
      }
      xyz_moir_spf = {
        name    = "moir.xyz"
        content = "\"v=spf1 include:spf.migadu.com -all\""
      }
      xyz_moir_dmarc = {
        name    = "_dmarc.moir.xyz"
        content = "\"v=DMARC1; p=quarantine;\""
      }
    }
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

resource "cloudflare_dns_record" "xyz_moir_records_mx" {
  for_each = local.xyz_moir_records.mx

  name     = each.value.name
  content  = each.value.content
  priority = each.value.priority

  proxied  = false
  ttl      = 3600
  type     = "MX"
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
