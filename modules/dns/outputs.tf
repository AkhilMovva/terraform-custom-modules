output "mydomain_zone_id" {
  description = "The Hosted Zone id of the desired Hosted zone"
  value       = data.aws_route53_zone.mydomain.zone_id
}