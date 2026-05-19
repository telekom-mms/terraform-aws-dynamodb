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
