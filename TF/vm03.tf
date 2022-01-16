# Resources for the always free Instance of VM
# shape name is VM.Standard.E2.1.Micro
#
# Always free only 2 instances of VM
# and
# the one VM.Standard.A1.Flex
# with CPU <=4 and RAM <= 24Gb
#--------------------------------------------------
# Примечание:
# Виртуальная машина VM.Standard.A1.Flex в регионе
# eu-frankfurt-1 доступна только в домене
# XCyi:EU-FRANKFURT-1-AD-2
#--------------------------------------------------

resource "oci_core_instance" "free_instance03" {
  availability_domain = data.oci_identity_availability_domain.adaarch.name
  compartment_id      = var.tenancy_ocid
  display_name        = "vm-germany-03"
  # the next shape will always free
  shape               = "VM.Standard.A1.Flex"

  shape_config  {
    ocpus = 2.0
    memory_in_gbs = 16.0
  }


# All network resources are describe in the network.tf
#
  create_vnic_details {
    subnet_id        = oci_core_subnet.my_own_subnet.id
    display_name     = "primaryvnic"
    assign_public_ip = true
    hostname_label   = "vm-germany-03"
  }

  source_details {
    source_type = "image"
    # list of images in the file images.tf
    # for example:
    # source_id   = var.images["cent-os-7x"]
    source_id = var.images["ubuntu-20-04-aarch"]
  }

  metadata = {
    ssh_authorized_keys = "${file("~/.ssh/vm-german-03.pub")}"
  }
}


# Needed to output public IP and username
#

output "public_ip_vm03" {
     description = "The public IP address of the virtual machine."
     value = oci_core_instance.free_instance03.public_ip
}

output "private_ip_vm03" {
     description = "The private IP address of the virtual machine."
     value = oci_core_instance.free_instance03.private_ip
}

#
# End of vm03.tf
