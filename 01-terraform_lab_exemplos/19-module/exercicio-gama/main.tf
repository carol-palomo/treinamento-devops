provider "aws" {
  region = "us-east-1"
}

module "criar_vpc" {
  source = "./vpc"
  nome = "terraform_module_vpc-carol"
}
