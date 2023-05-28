# variables.tf
variable "access_key" {
  description = "Access key to AWS console"
}

variable "secret_key" {
  description = "Secret key to AWS console"
}

variable "region" {
  description = "AWS region"
}

variable "mysql_username" {
  description = "MYSQL username"
}

variable "mysql_password" {
  description = "MYSQL password"
}
