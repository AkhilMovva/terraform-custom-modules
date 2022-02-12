data "aws_route53_zone" "mydomain" {
  name = var.domain_name
}

resource "aws_route53_record" "mysql_dns" {
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = "mysql.${var.environment}.akhilmovva.live"
  type    = "A"
  ttl     = "300"
  records = [var.mysql_ip]
}

resource "aws_route53_record" "flask_dns" {
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = "flask.${var.environment}.akhilmovva.live"
  type    = "A"
  ttl     = "300"
  records = [var.flask_ip]
}

