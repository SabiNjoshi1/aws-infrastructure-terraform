resource "aws_db_instance" "myrds" {
  allocated_storage   = 20
  storage_type        = "gp2"
  identifier          = "rdstf"
  engine              = "mysql"
  engine_version      = "8.0.27"
  instance_class      = "db.t2.micro"
  username            = "admin"
  password            = "Passw0rd!123"
  publicly_accessible = true
  skip_final_snapshot = true

  tags = {
    Name = "MyRDS"
  }
}

resource "aws_security_group" "rds-sj"{
  ingress{
    from_port        = 3306
    to_port          = 3306
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress{
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
