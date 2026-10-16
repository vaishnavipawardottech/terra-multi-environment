variable "custom_env" {
  type = string
  description = "The Environment for Infrastructure"
}

variable "table_count" {
  description = "Number of DynamoDB tables to create"
  type        = number
}