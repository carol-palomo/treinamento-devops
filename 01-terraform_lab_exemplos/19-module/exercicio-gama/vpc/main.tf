resource "aws_vpc" "my_vpc" {
  cidr_block = "10.16.0.0/22"

  tags = {
    Name = "${var.nome}"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.16.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.nome}-subnet_a"
  }
}

resource "aws_subnet" "my_subnet_b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.16.1.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "${var.nome}-subnet_b"
  }
}

resource "aws_subnet" "my_subnet_c" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.16.2.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "${var.nome}-subnet_c"
  }
}
