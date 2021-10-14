terraform {
  required_version = ">= 0.12" # colocando compatibilidade do terraform para 0.12
}

resource "aws_instance" "web" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  subnet_id = "subnet-05880ea9006199004"
  tags = {
    Name = "${var.nome}"
  }
  
 root_block_device {
    volume_size           = "8"
    volume_type           = "gp2"
    encrypted             = true
    kms_key_id            = "f48a0432-3f72-4888-9b31-8bdf1c121a4c"
    delete_on_termination = true
 }
  
}
