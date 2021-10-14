variable "subnet_id" {
  type = string
  description = "Digite o id da subnet: "
}

variable "nome" {
  type = string
  description = "Digite o nome da instancia: "
}

variable ec2_type {
  type    = list(string)
  default = ["micro", "medium", "large"]
}
