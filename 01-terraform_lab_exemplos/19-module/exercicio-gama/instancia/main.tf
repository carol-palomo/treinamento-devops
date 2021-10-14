resource "aws_instance" "web" {
  count = length(var.ec2_type)
  for_each = toset(var.ec2_type)
  instance_type = "t2.${each.value}
  
  ami                     = ami-09e67e426f25ce0d7
#  instance_type          = "t3.micro"
  key_name                = "id_rsa" # key chave publica cadastrada na AWS 
  subnet_id               =  module.aws_subnet.my_subnet.id # vincula a subnet direto e gera o IP automático
  private_ip              = "10.16.0.101"
  hibernation             = false
  associate_public_ip_address = true
#  vpc_security_group_ids  = [
#    "${aws_security_group.allow_ssh_terraform.id}",
#  ]
  
  root_block_device {
    volume_size           = "8"
    volume_type           = "gp2"
    encrypted             = true
    kms_key_id            = "f48a0432-3f72-4888-9b31-8bdf1c121a4c"
    delete_on_termination = true
    tags = {}
  }
  
  credit_specification {
    cpu_credits = "unlimited"
      }

  tags = {
    Name = "var.nome-${count.index}"
  }
}
