variable "region" {
  default = "us-east-1a"
}

variable "environment" {
  description = "Deployment Environment"
}

variable "vpc_cidr" {
  description = "CIDR block of the vpc"
  default = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
  type=list(any)
  description = "CIDR block for public subnet"
  default = [ "10.0.1.0/24" ]
}

variable "private_subnets_cidr" {
  type=list(any)
  description = "CIDR block for private subnet"
  default = [ "10.0.10.0/24" ]
}