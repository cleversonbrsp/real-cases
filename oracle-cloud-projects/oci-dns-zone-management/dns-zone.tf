resource "oci_dns_zone" "primary_zone" {
  # Required
  compartment_id = oci_identity_compartment.dns_management_oci_project.id
  name           = "devops-labs.store"
  zone_type      = "PRIMARY"
  scope          = "GLOBAL"
  depends_on     = [oci_identity_compartment.dns_management_oci_project]
}

resource "oci_dns_rrset" "type_a_record" {
  # Required
  zone_name_or_id = oci_dns_zone.primary_zone.id
  domain          = var.rrset_domain
  rtype           = "A"
  depends_on      = [oci_dns_zone.primary_zone]

  items {
    #Required
    domain = var.rrset_domain
    rdata  = var.rdata
    rtype  = "A"
    ttl    = "30"
  }
}