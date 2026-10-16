resource "aws_dynamodb_table" "basic-dynamodb-table" {
  count        = var.table_count
  name           = "${var.custom_env}-app-dynamo-table-${count.index + 1}"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "${var.custom_env}-app-dynamo-table-${count.index + 1}"
    Environment = var.custom_env
  }
}
