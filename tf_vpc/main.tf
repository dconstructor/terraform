# main.tf

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_security_group" "rds_sg" {
  name   = "rds_sg"
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_subnet" "subnet_az1" {
    id = "subnet-0dadfe353fa661e64"
}

data "aws_subnet" "subnet_az2" {
    id = "subnet-0f88c1c3b0fd4bcbe"
}

resource "aws_db_subnet_group" "example" {
  name = "main"
  subnet_ids = [
    data.aws_subnet.subnet_az1.id,data.aws_subnet.subnet_az2.id
  ]
}

resource "aws_db_instance" "mysql_instance" {
  engine                 = "mysql"
  identifier             = "mysqlinstance"
  db_subnet_group_name   = aws_db_subnet_group.example.name
  allocated_storage      = 20
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  username               = var.mysql_username
  password               = var.mysql_password
  parameter_group_name   = "default.mysql5.7"
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  skip_final_snapshot    = true
  publicly_accessible    = true
  db_name = "demodb"
}
