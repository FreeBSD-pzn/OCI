# Resources for the always free Instance of VM
# shape name is VM.Standard.E2.1.Micro
#
# Always free only 2 instances of VM
#-----------------------------------------------

resource "oci_core_instance" "free_instance01" {
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.tenancy_ocid
  display_name        = "vm-germany-01"
  # the next shape will always free
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
    # list of images in the file images.tf
    # for example:
    # source_id = var.images["ubuntu-18-04"]
    source_id   = var.images["cent-os-7x"]
  }

  metadata = {
    ssh_authorized_keys = "${file("~/.ssh/vm-german-01.pub")}"
  }
}


# Needed to output public IP and username
#

output "public_ip_vm01" {
     description = "The public IP address of the virtual machine."
     value = oci_core_instance.free_instance01.public_ip
}

output "private_ip_vm01" {
     description = "The private IP address of the virtual machine."
     value = oci_core_instance.free_instance01.private_ip
}

#
# End of vm01.tf
