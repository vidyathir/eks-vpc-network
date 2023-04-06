variable "region_name" {
  type    = string
  default = "us-east-1"
}
variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"

}
variable "environment" {
  type    = string
  default = "prod"
}
variable "public_subnets" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}
variable "private_subnets" {
  type    = list(string)
  default = ["10.0.2.0/24", "10.0.3.0/24"]
}
variable "public_az" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1c"]
}
variable "private_az" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1c"]
}
variable "aws_access_key_id" {
  type    = string
  default = "AKIATJERMLEMM4K6J7MZ"
}
variable "aws_secret_access_key" {
  type    = string
  default = "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"
}