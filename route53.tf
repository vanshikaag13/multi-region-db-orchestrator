resource "aws_route53_zone" "main" {
  name = "multi-db-orchestrator.com" 
}

resource "aws_route53_record" "primary_record" {
  zone_id = aws_route53_zone.main.zone_id
  name     = "primary-db.multi-db-orchestrator.com" 
  type     = "CNAME"
  ttl      = "60"
  records   = [aws_db_instance.primary.address]
}   

resource "aws_route53_record" "replica_record" {
  provider = aws.replica
  zone_id  = aws_route53_zone.main.zone_id
  name      = "replica-db.multi-db-orchestrator.com" 
  type      = "CNAME"
  ttl       = "60"
  records   = [aws_db_instance.replica.address]
}