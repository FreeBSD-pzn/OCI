# Resources for the always free Instance of VM
# shape name is VM.Standard.E2.1.Micro
#
# Always free only 2 instances of VM
#-----------------------------------------------

resource "oci_core_instance" "free_instance01" {
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.tenancy_ocid
  display_name        = "vm-germany-01"
  shape               = "VM.Standard.E2.1.Micro"


# All network resources are describe in the network.tf
#
  create_vnic_details {
    subnet_id        = oci_core_subnet.my_own_subnet.id
    display_name     = "primaryvnic"
    assign_public_ip = true
    hostname_label   = "vm-germany-01"
  }

  source_details {
    source_type = "image"
    source_id   = var.images["cent-os-7x"]
  }

  metadata = {
    ssh_authorized_keys = "${file("~/.ssh/vm-german-01.pub")}"
  }
}


# Needed to output public IP and username
#