resource "oci_dns_zone" "test_zone" {
  # Required
  compartment_id = oci_identity_compartment.dns_management_project.id
  name           = "devops-labs.store"
  zone_type      = "PRIMARY"
  scope          = "GLOBAL"
}

resource "oci_dns_record" "test_record" {
  # Required
  zone_name_or_id = oci_dns_zone.test_zone.id
  domain          = "www.devops-labs.store"
  rtype           = "A"

  # Optional
  rdata = "192.168.1.1"
  ttl   = 300

  depends_on = [oci_dns_zone.test_zone]
}
