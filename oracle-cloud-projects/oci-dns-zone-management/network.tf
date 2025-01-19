resource "oci_core_vcn" "vcn_dns_project" {
  compartment_id = oci_identity_compartment.dns_management_oci_project.id
  cidr_block     = "192.168.0.0/16"
  display_name   = "vcn-dns-project"
}

resource "oci_core_subnet" "pub_subnet" {
  cidr_block     = "192.168.0.0/16"
  display_name   = "pubsub-dns-project"
  compartment_id = oci_identity_compartment.dns_management_oci_project.id
  vcn_id         = oci_core_vcn.vcn_dns_project.id
}

resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = oci_identity_compartment.dns_management_oci_project.id
  display_name   = "igw"
  enabled        = "true"
  vcn_id         = oci_core_vcn.vcn_dns_project.id
}

resource "oci_core_default_route_table" "default_route_table" {
  display_name = "pub-rt"
  route_rules {
    description       = "traffic to/from internet"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
  }
  manage_default_resource_id = oci_core_vcn.vcn_dns_project.default_route_table_id
}

resource "oci_core_security_list" "sec_list" {
  compartment_id = oci_identity_compartment.dns_management_oci_project.id
  display_name   = "sec_list"
  vcn_id = oci_core_vcn.vcn_dns_project.id
  ingress_security_rules {
    description = "Allow all communicate"
    protocol    = "all"
    source      = "0.0.0.0/0"
    stateless   = "false"
  }

}