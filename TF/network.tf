# File is: network.tf
# Oracle Cloud Infrastructure
#
# Describe all network resources in the tenancy
# to use default resources.
#
#-----------------------------------------------

resource "oci_core_virtual_network" "my_own_vcn" {
  cidr_block     = "10.1.0.0/16"
  compartment_id = var.tenancy_ocid
  display_name   = "myownVCN"
  dns_label      = "myownvcn"
}

resource "oci_core_subnet" "my_own_subnet" {
  # Required
  cidr_block        = "10.1.20.0/28"
  compartment_id    = var.tenancy_ocid
  vcn_id            = oci_core_virtual_network.my_own_vcn.id

  # Optional
  display_name      = "subnet01"
  dns_label         = "subnet01"

  route_table_id    = oci_core_virtual_network.my_own_vcn.default_route_table_id
  dhcp_options_id   = oci_core_virtual_network.my_own_vcn.default_dhcp_options_id
}

resource "oci_core_internet_gateway" "my_own_internet_gateway" {
  compartment_id = var.tenancy_ocid
  display_name   = "Internet Gateway IG"
  vcn_id         = oci_core_virtual_network.my_own_vcn.id
}

resource "oci_core_default_route_table" "route_table" {
  manage_default_resource_id = oci_core_virtual_network.my_own_vcn.default_route_table_id

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.my_own_internet_gateway.id
  }
}

resource "oci_core_default_security_list" "add_some_rule" {
   manage_default_resource_id = oci_core_virtual_network.my_own_vcn.default_security_list_id

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol = "all"
    source   = "10.1.20.0/28"
  }

  ingress_security_rules {
    # To get protocol numbers see
    # https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml
    # ICMP is 1
    protocol = "1"
    source   = "0.0.0.0/0"

    icmp_options {
      type = 3
      code = 4
    }
  }

  ingress_security_rules {
    # To get protocol numbers see
    # https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml
    # ICMP is 1
    protocol = "1"
    source   = "10.1.0.0/16"

    icmp_options {
      type = 3
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = "22"
      min = "22"
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = "8080"
      min = "8080"
    }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = "80"
      min = "80"
    }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = "443"
      min = "443"
    }
  }
}
#
#