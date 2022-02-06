resource "aws_s3_bucket" "state_of_terraform" {
   bucket = "goodbyespy"

   lifecycle {
      prevent_destroy = true
   }

   # Like an OpenVMS operating system
   # filename.ext;number_of_versions
   # text.txt;1 text.txt;2 and so on ...
   # but on OpenVMS you can chose How many versions
   # you need to keep
   # do you remember PURGE command on OpenVMS
   # $ PURGE/KEEP=3 for example

   versioning {
      enabled = true
   }

   server_side_encryption_configuration {
      rule {
         apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
         }
      }
   }
}
