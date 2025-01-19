resource "oci_dns_zone" "primary_zone" {
  # Required
  compartment_id = oci_identity_compartment.dns_management_oci_project.id
  name           = "devops-labs.store"
  zone_type      = "PRIMARY"
  scope          = "GLOBAL"
}

resource "oci_dns_rrset" "type_a_record" {
  # Required
  zone_name_or_id = oci_dns_zone.primary_zone.id
  domain          = "www.devops-labs.store"
  rtype           = "A"
  depends_on = [oci_dns_zone.primary_zone]
}
