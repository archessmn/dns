locals {
  buzz_ury-with_zone_id = "6a17c8496d0eac867ec0b7a8108e987c"

  buzz_ury-with_records = {
    alias = {
      buzz_ury-with = {
        name    = "ury-with.buzz."
        content = "temjin.infra.archess.mn."
      }
    }
    cname = {
      buzz_ury-with = {
        name    = "_acme-challenge.ury-with.buzz."
        content = "temjin.infra.archess.mn."
      }
    }
  }
}

resource "powerdns_record" "buzz_ury-with_records_alias" {
  for_each = local.buzz_ury-with_records.alias

  name    = each.value.name
  records = [each.value.content]

  ttl  = 3600
  type = "ALIAS"
  zone = "ury-with.buzz."
}

resource "powerdns_record" "buzz_ury-with_records_cname" {
  for_each = local.buzz_ury-with_records.cname

  name    = each.value.name
  records = [each.value.content]

  # tags     = []
  ttl  = 3600
  type = "CNAME"
  zone = "ury-with.buzz."
  # settings = {}
  # comment  = var.dns_record_comment
}
