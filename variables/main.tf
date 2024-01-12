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

locals {
  name_instance = "instance example"
  name_instance_two = "instance example 2"
  subnet_ids = toset([
    "subnet1",
    "subnet2"
  ])
  name_workspaces = terraform.workspace //Obtener el nombre del workspace en el que se trabaja
}

resource "aws_instance" "example" {
  count         = 1 // Total instances to create
  ami           = var.instance_ami
  instance_type = var.instance_type
  tags = {
    Name = local.name_instance
  }
}


resource "aws_instance" "example2" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  
  tags = {
    Name = local.name_instance_two
  } // Metadata for identify instance in aws

  depends_on = [ aws_instance.example ] // Metadata Depending other resources
}


resource "aws_instance" "example3" {
  for_each = local.subnet_ids //foreach array

  ami           = var.instance_ami
  instance_type = var.instance_type 
  subnet_id = each.key
  
  tags = {
    Name = "Server ${each.key}"
  } // Metadata for identify instance in aws

  depends_on = [ aws_instance.example ] // Metadata Depending other resources
}