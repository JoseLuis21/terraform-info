terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  access_key = var.aws_access_key_user
  secret_key = var.aws_secret_key_user
}

module "instances" {
  source = "./instances"

  # Variables
  instance_type = "t3.micro"
  instance_ami = "ami-0c55b159cbfafe1f0"
}


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
  ami           = ""
  instance_type = module.instances.instance_ip // Esta variable viene de la salida del modulo instances
  tags = {
    Name = local.name_instance
  }
  

  depends_on = [ module.instances ] // Depende del modulo
}