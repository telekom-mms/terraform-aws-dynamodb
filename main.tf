// main.tf
# Written by Marc Straubinger - Overhauled for Security-First Best Practices

# DynamoDB Table
resource "aws_dynamodb_table" "this" {
  name                        = var.table_name != "" ? var.table_name : "${local.name_prefix}-table"
  billing_mode                = var.billing_mode
  hash_key                    = var.hash_key
  range_key                   = var.range_key
  deletion_protection_enabled = var.deletion_protection_enabled

  dynamic "attribute" {
    for_each = var.attributes
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  dynamic "global_secondary_index" {
    for_each = var.global_secondary_indexes
    content {
      name               = global_secondary_index.value.name
      hash_key           = global_secondary_index.value.hash_key
      range_key          = global_secondary_index.value.range_key
      projection_type    = global_secondary_index.value.projection_type
      non_key_attributes = global_secondary_index.value.non_key_attributes
      read_capacity      = var.billing_mode == "PROVISIONED" ? lookup(global_secondary_index.value, "read_capacity", 5) : null
      write_capacity     = var.billing_mode == "PROVISIONED" ? lookup(global_secondary_index.value, "write_capacity", 5) : null
    }
  }

  dynamic "local_secondary_index" {
    for_each = var.local_secondary_indexes
    content {
      name               = local_secondary_index.value.name
      range_key          = local_secondary_index.value.range_key
      projection_type    = local_secondary_index.value.projection_type
      non_key_attributes = local_secondary_index.value.non_key_attributes
    }
  }

  # PSA Compliance: Req 1 (data protection)
  point_in_time_recovery {
    enabled = var.point_in_time_recovery_enabled
  }

  # PSA Compliance: Req 5 (database encryption at rest)
  server_side_encryption {
    enabled     = true
    kms_key_arn = var.kms_key_arn
  }

  stream_enabled   = var.stream_enabled
  stream_view_type = var.stream_enabled ? var.stream_view_type : null

  dynamic "ttl" {
    for_each = var.ttl_enabled ? [1] : []
    content {
      enabled        = var.ttl_enabled
      attribute_name = var.ttl_attribute_name
    }
  }

  lifecycle {
    precondition {
      condition     = !var.stream_enabled || var.stream_view_type != ""
      error_message = "stream_view_type must be set when stream_enabled is true."
    }

    precondition {
      condition     = !var.ttl_enabled || var.ttl_attribute_name != ""
      error_message = "ttl_attribute_name must be set when ttl_enabled is true."
    }
  }

  tags = merge(local.common_tags, {
    "Name"          = var.table_name != "" ? var.table_name : "${local.name_prefix}-table"
    "PSA-Compliant" = "true"
  })
}

# DynamoDB Resource Policy
# PSA Compliance: Granular access control
resource "aws_dynamodb_resource_policy" "this" {
  count        = var.resource_policy != "" ? 1 : 0
  resource_arn = aws_dynamodb_table.this.arn
  policy       = var.resource_policy
}
