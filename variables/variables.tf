variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}


variable "instance_ami" {
  description = "ec2 AMI"
  type        = string
  default     = ""
}


variable "aws_access_key_user" {
  description = "AWS ACCESS KEY"
  type        = string
  default     = ""
}


variable "aws_secret_key_user" {
  description = "AWS SECRET KEY"
  type        = string
  default     = ""
}