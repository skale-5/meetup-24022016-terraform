variable "groove_count" {
  default = 10
}

variable "aws_region" {
  default = "eu-central-1"
}

# ubuntu-trusty-14.04 (x64)
variable "aws_amis" {
  default = {
    "eu-central-1" = "ami-87564feb"
  }
}

variable "key_name" {
  default = "yann.coleu.new.pub"
}

