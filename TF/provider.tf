# All variables are defined in the variable.ft file
#---------------------------------------------------
provider "oci" {
    version	     = ">= 3.27.0"
    region	     = "${var.region}"
    tenancy_ocid     = "${var.tenancy_ocid}"
    user_ocid	     = "${var.user_ocid}"
    fingerprint	     = "${var.fingerprint}"
    private_key_path = "${var.private_key_path}"
}

provider "aws" {
    region = "us-east-2"
}
