provider "aws" {
  region = "us-east-1"
}

module "criar_instancia" {
  source = "./instancia"
  nome = "terraform_module-carol"
}
