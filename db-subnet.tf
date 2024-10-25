resource "aws_db_subnet_group" "dbsubnet" {
  name       = "main-db-subnet-group"
  subnet_ids = [aws_subnet.private.id]

  tags = {
    Name = "Main DB Subnet Group"
  }
}
