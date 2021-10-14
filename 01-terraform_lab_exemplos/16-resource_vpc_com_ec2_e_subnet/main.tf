provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = "id_rsa" # key chave publica cadastrada na AWS 
  # subnet_id        =  aws_subnet.my_subnet.id # vincula a subnet direto e gera o IP automático
  tags = {
    Name = "Maquina para testar VPC"
  }

  network_interface {
    network_interface_id = aws_network_interface.my_subnet.id # vincula a subnet com ip fixo
    device_index         = 0                                  # DeviceIndex - The network interface's position in the attachment order. For example, the first attached network interface has a DeviceIndex of 0. 
  }

  root_block_device {
    volume_size           = "8"
    volume_type           = "gp2"
    encrypted             = true
    kms_key_id            = "f48a0432-3f72-4888-9b31-8bdf1c121a4c"
    delete_on_termination = true
  }

}

resource "aws_instance" "web2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = "id_rsa"
  tags = {
    Name = "Maquina2 para testar VPC"
  }

  network_interface {
    network_interface_id = aws_network_interface.my_subnet_b.id # vincula a subnet com ip fixo
    device_index         = 0
  }

  root_block_device {
    volume_size           = "8"
    volume_type           = "gp2"
    encrypted             = true
    kms_key_id            = "f48a0432-3f72-4888-9b31-8bdf1c121a4c"
    delete_on_termination = true
  }

}
