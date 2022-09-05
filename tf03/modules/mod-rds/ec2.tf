resource "aws_instance" "my-linux" {
  ami = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.sg_mariadb.id ]
  user_data = <<EOF
    #!/bin/bash
    yum install mariadb -y
  EOF
  tags = {
      Name="production1"
  }
}