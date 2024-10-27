resource "aws_db_instance" "replica" {
  provider              = aws.replica
  identifier            = "replica-db"
  engine               = "postgres"
  instance_class       = "db.t3.micro"
  allocated_storage     = 20
  db_subnet_group_name  = aws_db_subnet_group.replica.name
  vpc_security_group_ids = [aws_security_group.main.id]
  replicate_source_db   = aws_db_instance.primary.id
  username             = "db_user"
  password             = "db_password" # Use a secure method for production
  skip_final_snapshot  = true

  tags = {
    Name = "ReplicaDB"
  }
}