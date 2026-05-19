// locals.tf

locals {
  name_prefix = var.name_prefix != "" ? var.name_prefix : "${var.project_name}-${var.environment}"
  table_name  = var.table_name != "" ? var.table_name : "${local.name_prefix}-table"

  common_tags = merge(var.tags, {
    "Project"       = var.project_name
    "Environment"   = var.environment
    "ManagedBy"     = "Terraform"
    "PSA-Compliant" = "true"
  })
}
