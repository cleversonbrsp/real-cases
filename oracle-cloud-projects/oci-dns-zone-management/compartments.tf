resource "oci_identity_compartment" "dns_management_project" {
  compartment_id = var.comp_id
  description    = "dns project"
  name           = "dns_management_project"
  enable_delete  = true
}