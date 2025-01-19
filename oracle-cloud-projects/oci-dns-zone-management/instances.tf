resource "oci_core_instance" "sao_paulo_instance" {
  availability_domain  = var.sampa_ad
  compartment_id       = oci_identity_compartment.dns_management_oci_project.id
  display_name         = "web-sampa"
  shape                = var.ampere_shape
  preserve_boot_volume = false

  shape_config {
    memory_in_gbs = 6
    ocpus         = 1
  }

  create_vnic_details {
    assign_private_dns_record = true
    assign_public_ip          = true
    subnet_id                 = oci_core_subnet.pub_subnet.id
  }

  metadata = {
    ssh_authorized_keys = var.ssh_instances_key
    # user_data           = base64encode(file("runner-userdata.sh"))
  }

  source_details {
    source_id   = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaada3igrdlrj7u5symehegwugcwzou5tnsmslfnddxp6qhmc6k62pa"
    source_type = "image"
  }
}