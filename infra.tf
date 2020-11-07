resource "aws_vpc" "main" {
  cidr_block = var.main_vpc

  tags = {
    Name = "main"
    type = "test"
  }
}
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}
resource "aws_default_route_table" "main_rt" {
  default_route_table_id = aws_vpc.main.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-07d535654fde890ad"
  }
}
resource "aws_subnet" "main_sub" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = var.main_sub

  tags = {
    Name = "Main"
  }
}
resource "aws_key_pair" "ec2_login" {
  key_name   = "ec2_login-key"
  public_key = var.login_key
}
resource "aws_instance" "main_ec2" {
  ami                    = var.main_ami
  instance_type          = var.main_type
  availability_zone      = var.main_sub
  key_name               = aws_key_pair.ec2_login.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  subnet_id              = aws_subnet.main_sub.id
}
resource "aws_eip" "main_lb" {
  instance = aws_instance.main_ec2.id
  vpc      = true
}
