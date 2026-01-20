locals {
  xyz_moir_zone_id = "9dd1263c0b1bda5a8d379c457da68fc3"

  xyz_moir_records = {
    a = {
      xyz_moir_host = {
        name    = "host.moir.xyz"
        content = "147.12.146.29"
      }
      xyz_moir = {
        name    = "moir.xyz"
        content = "147.12.146.29"
      }
    }

    aaaa = {
      xyz_moir_host = {
        name    = "host.moir.xyz"
        content = "2a02:6b67:e841:4900::10"
      }
      xyz_moir = {
        name    = "moir.xyz"
        content = "2a02:6b67:e841:4900::10"
      }
    }

    cname = {
      xyz_moir_immich = {
        name    = "immich.moir.xyz"
        content = "host.moir.xyz"
      }
      xyz_moir_play_map = {
        name    = "map.play.moir.xyz"
        content = "host.moir.xyz"
      }
      xyz_moir_wildcard = {
        name    = "*.moir.xyz"
        content = "temjin.infra.archess.mn"
      }
      xyz_moir_node-1 = {
        name    = "node-1.moir.xyz"
        content = "host.moir.xyz"
      }
      xyz_moir_vault = {
        name    = "vault.moir.xyz"
        content = "tsuro.infra.archess.mn"
      }
    }

    srv = {
      xyz_moir_play_uni__tcp__minecraft = {
        name = "_minecraft._tcp.uni.play.moir.xyz"
        data = {
          port     = 25507
          priority = 0
          target   = "node-1.moir.xyz"
          weight   = 0
        }
      }
    }

    txt = {
      xyz_moir_node-1__acme-challenge = {
        name    = "_acme-challenge.node-1.moir.xyz"
        content = "\"qXPGTpARvG5SAwGtFWS9Vyi0FYucJ5zfvNKAzdHohVY\""
      }
      xyz_moir__domainkey_default = {
        name    = "default._domainkey.moir.xyz"
        content = "\"v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvD58trLk35t4vV+hsg8pUioN4YU8LQPJOVSt5e1W9A5rhDBA+SfqI99Dfq42UmAyU8f0V8KrnvssTnPiqXe6+ghdh5DdqtmQeyVAmbhqHQfiD4iZseZ8EAGkR3Or4TnQM/XPRPMoWSxge+TD3GU+Nhmx39APAN3YeMME7VcebDzIytzWOgNAQloL87U2471M3IPyovgZGzG9MD10+7TIi8LilhXvvnumhTjaYcDl7FW2MD83vPV1qtXFW6OG5jqJ3/d3sob7AQS/iV18EV/SG2dxvuXCShMkHAtzKB8OIEO3JpUn7/pFE+28x11WCFi1Ewll8CjPVDlZvalYhMCKiQIDAQAB;\""
      }
      xyz_moir = {
        name    = "moir.xyz"
        content = "\"v=spf1 +mx +a +ip4:116.202.134.139 ~all\""
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
