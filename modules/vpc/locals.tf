locals {
  tags = merge(var.tags, {
    Created_by = "terraform"
    Project     = var.project
    Environment = var.environment
  })
}