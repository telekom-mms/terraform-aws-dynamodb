// examples/dynamodb-basic/outputs.tf

output "table_name" {
  description = "The name of the DynamoDB table"
  value       = module.dynamodb.table_name
}

output "table_arn" {
  description = "The ARN of the DynamoDB table"
  value       = module.dynamodb.table_arn
}

output "table_id" {
  description = "The ID of the DynamoDB table"
  value       = module.dynamodb.table_id
}
