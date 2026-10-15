variable "custom_env" {
  type = string
  description = "The Environment for Infrastructure"
}

variable "custom_ec2_count" {
  type = number
  description = "The count for ec2 instances"
}

variable "custom_ec2_ami" {
  type = string
  description = "The AMI for ec2 instances"
}

variable "custom_ec2_instance_type" {
  type = string
  description = "The instance type for ec2 instances"
}