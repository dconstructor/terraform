resource "aws_db_instance" "rds" {
  engine = "mariadb"
  engine_version = "10.6.8"
  instance_class = "db.t3.micro"
  db_name = "RAMDB"
  identifier = "database1"
  allocated_storage = 20
  storage_type = "gp2"
  username = var.username
  password = var.password
  publicly_accessible = true
  skip_final_snapshot = true
  vpc_security_group_ids = [ aws_security_group.sg_mariadb.id ]
  tags = {
      Name="RDServerInstance"
  }
}