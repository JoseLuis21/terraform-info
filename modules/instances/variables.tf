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