resource "oci_core_instance" "sao_paulo_instance" {
  availability_domain = var.sampa_ad
  compartment_id      = oci_identity_compartment.dns_management_project.id
  display_name        = "web-sampa"
  shape               = var.ampere_shape
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
     user_data           = base64encode(file("runner-userdata.sh"))
  }

  source_details {
    source_id   = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaada3igrdlrj7u5symehegwugcwzou5tnsmslfnddxp6qhmc6k62pa"
    source_type = "image"
  }
}


# resource "oci_core_instance" "ashburn_instance" {
#   provider            = oci.ashburn
#   availability_domain = var.ad_ashburn
#   compartment_id      = oci_identity_compartment.dns_management_project.id
#   display_name        = "web-ashburn"
#   shape               = var.ampere_shape

#   shape_config {
#     memory_in_gbs = 6
#     ocpus         = 1
#   }

#   create_vnic_details {
#     assign_private_dns_record = true
#     assign_public_ip          = true
#     subnet_id                 = oci_core_subnet.pub_subnet.id
#   }

#   metadata = {
#     "ssh_authorized_keys" = var.ssh_instances_key
#   }

#   source_details {
#     source_id   = "ocid1.image.oc1.iad.aaaaaaaa7pcinz56i62x2muddss4mateclv2ikbdnxvyp6udsmydwag7pexa"
#     source_type = "image"
#   }
# }


# agent_config {
#   is_management_disabled = "false"
#   is_monitoring_disabled = "false"
#   plugins_config {
#     desired_state = "ENABLED"
#     name          = "Vulnerability Scanning"
#   }
#   plugins_config {
#     desired_state = "ENABLED"
#     name          = "Oracle Java Management Service"
#   }
#   plugins_config {
#     desired_state = "ENABLED"
#     name          = "OS Management Service Agent"
#   }
#   plugins_config {
#     desired_state = "ENABLED"
#     name          = "Compute Instance Run Command"
#   }
#   plugins_config {
#     desired_state = "ENABLED"
#     name          = "Compute Instance Monitoring"
#   }
#   plugins_config {
#     desired_state = "ENABLED"
#     name          = "Block Volume Management"
#   }
#   plugins_config {
#     desired_state = "ENABLED"
#     name          = "Bastion"
#   }
# }
# availability_config {
#   recovery_action = "RESTORE_INSTANCE"
# }
# instance_options {
#   are_legacy_imds_endpoints_disabled = "false"
# }
# is_pv_encryption_in_transit_enabled = "true"