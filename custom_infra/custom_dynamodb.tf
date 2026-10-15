resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "${var.custom_env}-app-dynamo-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "${var.custom_env}-app-dynamo-table"
    Environment = var.custom_env
  }
}
