locals {
  mn_archess_zone_id = "d34404fdefd6e0cbae3f0cb90e04fd2c"

  mn_archess_records = {
    a = {
      mn_archess_infra_temjin = {
        name    = "temjin.infra.archess.mn"
        content = "147.12.146.29"
      }
      mn_archess_infra_tsuro = {
        name    = "tsuro.infra.archess.mn"
        content = "185.213.25.136"
      }
      mn_archess_infra_temjin_v4 = {
        name    = "v4.temjin.infra.archess.mn"
        content = "147.12.146.29"
      }
      mn_archess_infra_tsuro_v4 = {
        name    = "v4.tsuro.infra.archess.mn"
        content = "185.213.25.136"
      }
    }

    aaaa = {
      mn_archess_infra_temjin = {
        name    = "temjin.infra.archess.mn"
        content = "2a02:6b67:e841:4900::10"
      }
      mn_archess_infra_tsuro = {
        name    = "tsuro.infra.archess.mn"
        content = "2a02:c206:2228:4949::1"
      }
      mn_archess_infra_temjin_v6 = {
        name    = "v6.temjin.infra.archess.mn"
        content = "2a02:6b67:e841:4900::10"
      }
      mn_archess_infra_tsuro_v6 = {
        name    = "v6.tsuro.infra.archess.mn"
        content = "2a02:c206:2228:4949::1"
      }
    }

    cname = {
      mn_archess_wildcard = {
        name    = "*.archess.mn"
        content = "moir.xyz"
      }
      mn_archess_ = {
        name    = "archess.mn"
        content = "archessmn.github.io"
      }
      mn_archess_beszel = {
        name    = "beszel.archess.mn"
        content = "tsuro.infra.archess.mn"
      }
      mn_archess_minio_console = {
        name    = "console.minio.archess.mn"
        content = "host.moir.xyz"
      }
      mn_archess_idm = {
        name    = "idm.archess.mn"
        content = "tsuro.infra.archess.mn"
      }
      mn_archess_infra_zenith_jenkins = {
        name    = "jenkins.zenith.infra.archess.mn"
        content = "tsuro.infra.archess.mn"
      }
      mn_archess_kasm = {
        name    = "kasm.archess.mn"
        content = "host.moir.xyz"
      }
      mn_archess_meet = {
        name    = "meet.archess.mn"
        content = "host.moir.xyz"
      }
      mn_archess_minio = {
        name    = "minio.archess.mn"
        content = "host.moir.xyz"
      }
      mn_archess_infra_atlas_pve = {
        name    = "pve.atlas.infra.archess.mn"
        content = "tsuro.infra.archess.mn"
      }
      mn_archess_sheets = {
        name    = "sheets.archess.mn"
        content = "host.moir.xyz"
      }
      mn_archess__domainkey_sig1 = {
        name    = "sig1._domainkey.archess.mn"
        content = "sig1.dkim.archess.mn.at.icloudmailadmin.com"
      }
      mn_archess_sso = {
        name    = "sso.archess.mn"
        content = "tsuro.infra.archess.mn"
      }
      mn_archess_status = {
        name    = "status.archess.mn"
        content = "tsuro.infra.archess.mn"
      }
      mn_archess_infra_temjin_wildcard = {
        name    = "*.temjin.infra.archess.mn"
        content = "temjin.infra.archess.mn"
      }
      mn_archess_infra_tsuro_infra_wildcard = {
        name    = "*.tsuro.infra.archess.mn"
        content = "tsuro.infra.archess.mn"
      }
      mn_archess_uptime = {
        name    = "uptime.archess.mn"
        content = "tsuro.infra.archess.mn"
      }
    }

    mx = {
      mn_archess_1 = {
        content  = "mx01.mail.icloud.com"
        name     = "archess.mn"
        priority = 10
      }
      mn_archess_2 = {
        content  = "mx02.mail.icloud.com"
        name     = "archess.mn"
        priority = 10
      }
    }

    txt = {
      mn_archess_1 = {
        name    = "archess.mn"
        content = "\"apple-domain-verification=cAS8-ahEZZCYzPYC5Ai9VuaGo_DjXpypt2OA0vsfHVU\""
      }
      mn_archess_2 = {
        name    = "archess.mn"
        content = "\"v=spf1 include:icloud.com ~all\""
      }
      mn_archess_3 = {
        name    = "archess.mn"
        content = "\"apple-domain=0DNxqE4QjB3gx199\""
      }
      mn_archess__atproto = {
        name    = "_atproto.archess.mn"
        content = "\"did=did:plc:ohhvr7x5romdoc6vxhtpogc5\""
      }
      mn_archess__github-pages-challenge-archessmn = {
        name    = "_github-pages-challenge-archessmn.archess.mn"
        content = "\"d9c0f43401978731733bc454298fcd\""
      }
    }
  }
}

resource "cloudflare_dns_record" "mn_archess_records_a" {
  for_each = local.mn_archess_records.a

  name    = each.value.name
  content = each.value.content

  proxied  = false
  tags     = []
  ttl      = 1
  type     = "A"
  zone_id  = local.mn_archess_zone_id
  settings = {}
  comment  = var.dns_record_comment
}


resource "cloudflare_dns_record" "mn_archess_records_aaaa" {
  for_each = local.mn_archess_records.aaaa

  name    = each.value.name
  content = each.value.content

  proxied  = false
  tags     = []
  ttl      = 1
  type     = "AAAA"
  zone_id  = local.mn_archess_zone_id
  settings = {}
  comment  = var.dns_record_comment
}

resource "cloudflare_dns_record" "mn_archess_records_cname" {
  for_each = local.mn_archess_records.cname

  name    = each.value.name
  content = each.value.content

  proxied  = false
  tags     = []
  ttl      = 1
  type     = "CNAME"
  zone_id  = local.mn_archess_zone_id
  settings = {}
  comment  = var.dns_record_comment
}

resource "cloudflare_dns_record" "mn_archess_records_mx" {
  for_each = local.mn_archess_records.mx

  name     = each.value.name
  content  = each.value.content
  priority = each.value.priority

  proxied  = false
  ttl      = 3600
  type     = "MX"
  zone_id  = local.mn_archess_zone_id
  settings = {}
  comment  = var.dns_record_comment
}

resource "cloudflare_dns_record" "mn_archess_records_txt" {
  for_each = local.mn_archess_records.txt

  name    = each.value.name
  content = each.value.content

  proxied  = false
  tags     = []
  ttl      = 1
  type     = "TXT"
  zone_id  = local.mn_archess_zone_id
  settings = {}
  comment  = var.dns_record_comment
}
