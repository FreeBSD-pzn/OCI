# Create a table to keep locking while terraform operate
#
resource "aws_dynamodb_table" "looking_operate" {

   name = "goodbyespy"
   hash_key = "LockID"

   billing_mode = "PAY_PER_REQUEST"

   attribute {
       name = "LockID"
       type = "S"
   }
}