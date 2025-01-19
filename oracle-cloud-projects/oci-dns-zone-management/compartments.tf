resource "oci_identity_compartment" "dns_management_oci_project" {
  compartment_id = var.comp_id
  description    = "dns management oci project"
  name           = "dns_management_oci_project"
  enable_delete  = true
}