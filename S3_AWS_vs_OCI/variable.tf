# The list of variables to use with all files into this directory
# ---------------------------------------------------------------
# The next default values of variables
# has been moved to the terraform.tfvars file:
#
# tenancy_ocid
# user_ocid
# fingerprint
# private_key_path
# compartment_ocid
#
# because this variables are PRIVATE
#

variable "versions" {
	description = "API version for working with Terraform v 0.12.1"
	type	    = string
	default	    = "3.27.0"
}

variable "tenancy_ocid" {
	description = "Your Tenancy ID in the Oracle Cloud Infrastructure"
	type	    = string
}

variable "user_ocid" {
	description = "User Oracle Cloud ID"
	type	    = string
}

variable "fingerprint" {
	description = "Security key"
	type	    = string
}

variable "private_key_path" {
	description = "Path to security key"
	type	    = string
}

variable "compartment_ocid" {
	description = "Compartment Oracle Cloud ID"
	type	    = string
}

variable "region" {
	description = "The name of Region, where to launch services"
	type	    = string
	default	    = "eu-frankfurt-1"
}

# Another DATA

data "oci_identity_availability_domain" "ad" {
  compartment_id = var.tenancy_ocid
  ad_number      = "3"
}

data "oci_identity_availability_domain" "adaarch" {
  compartment_id = var.tenancy_ocid
  ad_number      = "2"
}

data "oci_objectstorage_namespace" "oci_s3" {
  compartment_id = var.tenancy_ocid
}

#-----------------------------------------------
# End of variables and data
