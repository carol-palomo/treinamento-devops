provider "aws" {
  region = "us-east-1"
}

module "criar_vpc" {
  source = "./vpc"
  nome = "terraform_module_vpc-carol"
}

module "criar_ec2" {
  source = "./instancia"
  nome = "terraform_module_ec2-carol"
}
