resource "aws_s3_bucket" "custom_app_bucket" {
  bucket = "${var.custom_env}-app-automate-terraform-bucket"

  tags = {
    Name = "${var.custom_env}-app-automate-terraform-bucket"
    Environment = var.custom_env
  }
}