terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~>6.21.0"
    }
  }
}

provider "oci" {
  region = "sa-saopaulo-1"
}

# provider "oci" {
#   alias               = "sampa"
#   region              = "sa-saopaulo-1"
#   config_file_profile = "sampa"
# }

# provider "oci" {
#   alias               = "ashburn"
#   region              = "us-ashburn-1"
#   config_file_profile = "ashburn"
# }