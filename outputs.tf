// outputs.tf

output "table_arn" {
  description = "The ARN of the DynamoDB table"
  value       = aws_dynamodb_table.this.arn
}

output "table_id" {
  description = "The ID of the DynamoDB table"
  value       = aws_dynamodb_table.this.id
}

output "table_name" {
  description = "The name of the DynamoDB table"
  value       = aws_dynamodb_table.this.name
}

output "table_stream_arn" {
  description = "The ARN of the Table Stream"
  value       = aws_dynamodb_table.this.stream_arn
}

output "table_stream_label" {
  description = "A timestamp, in ISO 8601 format, for the stream when it was enabled"
  value       = aws_dynamodb_table.this.stream_label
}

output "gsi_names" {
  description = "Names of the configured global secondary indexes"
  value       = [for index in var.global_secondary_indexes : index.name]
}

output "lsi_names" {
  description = "Names of the configured local secondary indexes"
  value       = [for index in var.local_secondary_indexes : index.name]
}

output "stream_arn" {
  description = "The ARN of the DynamoDB stream"
  value       = aws_dynamodb_table.this.stream_arn
}

output "stream_label" {
  description = "The label of the DynamoDB stream"
  value       = aws_dynamodb_table.this.stream_label
}

output "table_class" {
  description = "The storage class of the DynamoDB table"
  value       = aws_dynamodb_table.this.table_class
}
