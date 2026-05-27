locals {
  buzz_ury-with_zone_id = "6a17c8496d0eac867ec0b7a8108e987c"

  buzz_ury-with_records = {
    cname = {
      buzz_ury-with = {
        name    = "theshrine.net"
        content = "temjin.infra.archess.mn"
      }
    }
  }
}

resource "cloudflare_dns_record" "buzz_ury-with_records_cname" {
  for_each = local.buzz_ury-with_records.cname

  name    = each.value.name
  content = each.value.content

  proxied  = false
  tags     = []
  ttl      = 1
  type     = "CNAME"
  zone_id  = local.buzz_ury-with_zone_id
  settings = {}
  comment  = var.dns_record_comment
}
