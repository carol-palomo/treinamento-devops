provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami                     = data.aws_ami.ubuntu.id
  instance_type           = "t3.micro"
  key_name                = "id_rsa" # key chave publica cadastrada na AWS 
  subnet_id               =  aws_subnet.my_subnet.id # vincula a subnet direto e gera o IP automático
  private_ip              = "10.16.0.101"
  associate_public_ip_address = true
  vpc_security_group_ids  = [
    "${aws_security_group.allow_ssh_terraform.id}",
  ]
  
  root_block_device {
    volume_size           = "8"
    volume_type           = "gp2"
    encrypted             = true
    kms_key_id            = "f48a0432-3f72-4888-9b31-8bdf1c121a4c"
    delete_on_termination = true
    tags = {}
  }

  tags = {
    Name = "Maquina para testar VPC do terraform - carol"
  }
}

resource "aws_eip" "example" {
  vpc = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web.id
  allocation_id = aws_eip.example.id
}

# terraform refresh para mostrar o ssh

output "aws_instance_e_ssh" {
  value = [
    aws_instance.web.public_ip,
    "sudo ssh -i /root/.ssh/id_rsa ubuntu@${aws_instance.web.public_dns}"
  ]
}
