output "table_names" {
  description = "Names of the DynamoDB tables"
  value       = aws_dynamodb_table.basic-dynamodb-table[*].name
}

output "table_arns" {
  description = "ARNs of the DynamoDB tables"
  value       = aws_dynamodb_table.basic-dynamodb-table[*].arn
}