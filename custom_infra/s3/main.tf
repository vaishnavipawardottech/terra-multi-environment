resource "aws_s3_bucket" "custom_app_bucket" {
  count  = var.bucket_count
  bucket = "${var.custom_env}-app-automate-terraform-bucket-${count.index + 1}"

  tags = {
    Name = "${var.custom_env}-app-automate-terraform-bucket-${count.index + 1}"
    Environment = var.custom_env
  }
}