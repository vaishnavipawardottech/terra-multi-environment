locals {
  environments = {
    dev = {
      ec2_count = 2
    }
    stg = {
      ec2_count = 3
    }
    prd = {
      ec2_count = 4
    }
  }

  current_env    = terraform.workspace
  current_config = local.environments[local.current_env]
}

module "infra" {
  source = "./custom_infra"

  custom_env               = local.current_env
  custom_ec2_count         = local.current_config.ec2_count
  custom_ec2_ami           = "ami-02167eae61967e403"
  custom_ec2_instance_type = "t3.micro"
}










# without locals and workspace, we can use the below code to create multiple environments

# module "dev-infra" {

#   source = "./custom_infra"
#   custom_env = "dev"
#   custom_ec2_count = 2
#   custom_ec2_ami = "ami-02167eae61967e403"
#   custom_ec2_instance_type = "t3.micro"

# }

# module "stg-infra" {

#   source = "./custom_infra"
#   custom_env = "stg"
#   custom_ec2_count = 3
#   custom_ec2_ami = "ami-02167eae61967e403"
#   custom_ec2_instance_type = "t3.micro"

# }

# module "prd-infra" {

#   source = "./custom_infra"
#   custom_env = "prd"
#   custom_ec2_count = 4
#   custom_ec2_ami = "ami-02167eae61967e403"
#   custom_ec2_instance_type = "t3.micro"

# }