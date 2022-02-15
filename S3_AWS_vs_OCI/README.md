## Bucket inside AWS vs bucket inside OCI
```
Сравнение конфигурационных файлов для OCI и для AWS:

## Configuration for the object storage bucket in the OCI               | Configuration for the object storage bucket in the AWS
#                                                                       | #
resource "oci_objectstorage_bucket" "goodbyespy" {                      | resource "aws_s3_bucket" "state_of_terraform" {
   # Required                                                           |    #
   compartment_id = var.tenancy_ocid                                    |    #
   name           = "goodbyespy"                                        |    bucket = "goodbyespy"
   # Have a look at the variable.tf                                     |    #
   namespace      = data.oci_objectstorage_namespace.oci_s3.namespace   |    #
   #                                                                    |    #
   #Optional                                                            |    #
   # access_type  = by default NoPublicAccess                           |    #
   # auto_tiering = by default Disabled                                 |    #
   # kms_key_id   =                                                     |    #
   # metadata     =                                                     |    #
   # object_events_enabled =                                            |    #
   # object_lifecycle_policy_etag =                                     |    #
   # storage_tier =                                                     |    #
   # retention_rules {                                                  |    #
   #    display_name =                                                  |    #
   #    duration {                                                      |    #
   #       # Required                                                   |    #
   #       time_amount =                                                |    #
   #       time_unit   =                                                |    #
   #       }                                                            |    #
   #    time_rule_locked =                                              |    #
   # }                                                                  |    #
   versioning = "Enabled"                                               |    versioning {
   #                                                                    |      enabled = true
   #                                                                    |    }
   # In the OCI encryption always ON and can not be turned off          |    server_side_encryption_configuration {
   #                                                                    |      rule {
   #                                                                    |         apply_server_side_encryption_by_default {
   #                                                                    |            sse_algorithm = "AES256"
   #                                                                    |         }
   #                                                                    |      }
   #                                                                    |   }
}                                                                       | }
#-----------------------------------------------------------------------------------------------------------------------------
# End of s3.tf                                                          | # End of s3_bucket.tf

Описание как создать bucket в OCI см. оригинал:
https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/objectstorage_bucket

Дополнительно о шифровании информации в bucket OCI:
- шифрование включено всегда и его нельзя отключить
- https://docs.oracle.com/en-us/iaas/Content/Object/Tasks/encryption.htm#encryption

Как использовать bucket, созданный в OCI, для terraform state files:
https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/terraformUsingObjectStore.htm
```