#Set up database table to use for remote state
resource "aws_dynamodb_table" "terraform-locks" {
  name           = "terraform-locks"
  hash_key       = "LockID"
  read_capacity  = 1
  write_capacity = 1

  attribute {
    name = "LockID"
    type = "S"
  }

  tags {
    Name = "DynamoDB terraform.tfstate locking table"
  }
}
