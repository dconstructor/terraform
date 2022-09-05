resource "aws_security_group" "sg_mariadb" {
  name = "mariadb-sg-dev"
  vpc_id = data.aws_vpc.testing.id
  ingress {
      description = "db port vpc"
      from_port = 3306
      to_port = 3306
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
      description = "ssh port vpc"
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
  }
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = [ "0.0.0.0/0" ]
  }
  tags = {
      Name = "allow access mariadb"
  }
}