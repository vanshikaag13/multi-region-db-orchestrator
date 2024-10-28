resource "aws_route53_zone" "main" {
  name = "multi-db-orchestrator.com" 
}

resource "aws_route53_record" "primary_record" {
  zone_id = aws_route53_zone.main.zone_id
  name     = "primary-db.multi-db-orchestrator.com" # Change to your domain
  type     = "CNAME"
  ttl      = "60"
  records   = [aws_db_instance.primary.address]
}