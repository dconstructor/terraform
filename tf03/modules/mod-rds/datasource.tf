data "aws_vpc" "testing" {
  default = true
}

output "check_vpc_id" {
    value = data.aws_vpc.testing.id 
}
