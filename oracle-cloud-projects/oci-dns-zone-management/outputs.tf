output "sao_paulo_instance" {
  value = {
    private_ip = oci_core_instance.sao_paulo_instance.private_ip
    public_ip  = oci_core_instance.sao_paulo_instance.public_ip
  }
}

# output "ashburn_instance" {
#   value = {
#     private_ip = oci_core_instance.ashburn_instance.private_ip
#     public_ip  = oci_core_instance.ashburn_instance.public_ip
#   }
# }