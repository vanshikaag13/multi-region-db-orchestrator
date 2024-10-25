 resource "aws_db_instance" "primary" {
  identifier             = "orchestrator-primary-db"
  engine                = "postgres"
  instance_class        = "db.t3.micro"
  allocated_storage      = 20
  db_subnet_group_name   = aws_db_subnet_group.dbsubnet.name
  vpc_security_group_ids = [aws_security_group.main.id]
  username              = "db_user"
  password              = "db_password" # Use a secure method for production
  skip_final_snapshot   = true
  multi_az              = false
  storage_type          = "gp2"

  tags = {
    Name = "Primary DB"
  }
}