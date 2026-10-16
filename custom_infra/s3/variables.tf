variable "custom_env" {
  type = string
  description = "The Environment for Infrastructure"
}

variable "bucket_count" {
  description = "Number of S3 buckets to create"
  type        = number
}