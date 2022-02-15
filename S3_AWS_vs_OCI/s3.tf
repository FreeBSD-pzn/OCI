## Configuration for the object storage like S3 in AWS

resource "oci_objectstorage_bucket" "goodbyespy" {
   # Required
   compartment_id = var.tenancy_ocid
   name           = "goodbyespy"
   # Have a look at the variable.tf
   namespace      = data.oci_objectstorage_namespace.oci_s3.namespace

   #Optional
   # access_type  = by default NoPublicAccess
   # auto_tiering = by default Disabled
   # kms_key_id   =
   # metadata     =
   # object_events_enabled =
   # object_lifecycle_policy_etag =
   # storage_tier =
   # retention_rules {
   #    display_name =
   #    duration {
   #       # Required
   #       time_amount = 
   #       time_unit   =
   #       }
   #    time_rule_locked =
   # }
   versioning = "Enabled"
}
#------------------------------------------------------
# End of s3.tf
