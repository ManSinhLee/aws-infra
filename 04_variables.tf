variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "domain_name" {
  type    = string
  default = "cmcloudlab444.info"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "my_address" {
  type    = string
  default = "116.99.209.79/32"
}

variable "office_address" {
  type    = string
  default = "116.99.209.79/32"
}

variable "internet" {
  type    = string
  default = "0.0.0.0/0"
}

variable "internet_v6" {
  type    = string
  default = "::/0"
}
variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}