# Began to use S3 and DynamoDB AWS services
# to keep terraform state files

terraform {

   backend "s3" {

      region = "us-east-2"

      bucket = "goodbyespy"
      key    = "global/aws_s3/terraform.tfstate"

      dynamodb_table = "goodbyespy"

      encrypt        = true
     }
}
