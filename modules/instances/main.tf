locals {
  name_instance = "instance example"
  name_instance_two = "instance example 2"
  subnet_ids = toset([
    "subnet1",
    "subnet2"
  ])
}

resource "aws_instance" "example" {
  count         = 1 // Total instances to create
  ami           = var.instance_ami
  instance_type = var.instance_type
  tags = {
    Name = local.name_instance
  }
}

output "instance_ip" {
  value = aws_instance.example.private_ip
}