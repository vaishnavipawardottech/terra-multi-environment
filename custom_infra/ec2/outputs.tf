output "ec2_instance_public_ips" {
  value = aws_instance.custom_instance[*].public_ip
  description = "This shows the public IPs of your EC2 instances"
}