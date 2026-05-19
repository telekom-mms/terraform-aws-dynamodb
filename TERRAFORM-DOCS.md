<!-- BEGIN_TF_DOCS -->


## Requirements

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3 |

## Providers

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.35.1 |

## Resources

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_resource_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_resource_policy) | resource |
| [aws_dynamodb_table.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |

## Inputs

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attributes"></a> [attributes](#input\_attributes) | List of nested attribute definitions. Only required for hash\_key and range\_key attributes | <pre>list(object({<br/>    name = string<br/>    type = string<br/>  }))</pre> | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g., prod, dev, test) | `string` | n/a | yes |
| <a name="input_hash_key"></a> [hash\_key](#input\_hash\_key) | The attribute to use as the hash (partition) key | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project | `string` | n/a | yes |
| <a name="input_billing_mode"></a> [billing\_mode](#input\_billing\_mode) | Controls how you are charged for read and write throughput and how you manage capacity (PROVISIONED or PAY\_PER\_REQUEST) | `string` | `"PAY_PER_REQUEST"` | no |
| <a name="input_deletion_protection_enabled"></a> [deletion\_protection\_enabled](#input\_deletion\_protection\_enabled) | Whether to enable deletion protection for the table | `bool` | `true` | no |
| <a name="input_global_secondary_indexes"></a> [global\_secondary\_indexes](#input\_global\_secondary\_indexes) | Describe a GSI for the table | <pre>list(object({<br/>    name               = string<br/>    hash_key           = string<br/>    range_key          = optional(string)<br/>    projection_type    = string<br/>    non_key_attributes = optional(list(string))<br/>    read_capacity      = optional(number)<br/>    write_capacity     = optional(number)<br/>  }))</pre> | `[]` | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | The ARN of the KMS key to use for server-side encryption | `string` | `""` | no |
| <a name="input_local_secondary_indexes"></a> [local\_secondary\_indexes](#input\_local\_secondary\_indexes) | Describe an LSI for the table | <pre>list(object({<br/>    name               = string<br/>    range_key          = string<br/>    projection_type    = string<br/>    non_key_attributes = optional(list(string))<br/>  }))</pre> | `[]` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Prefix for resource names (if not provided, will use project-environment pattern) | `string` | `""` | no |
| <a name="input_point_in_time_recovery_enabled"></a> [point\_in\_time\_recovery\_enabled](#input\_point\_in\_time\_recovery\_enabled) | Whether to enable point-in-time recovery | `bool` | `true` | no |
| <a name="input_range_key"></a> [range\_key](#input\_range\_key) | The attribute to use as the range (sort) key | `string` | `null` | no |
| <a name="input_resource_policy"></a> [resource\_policy](#input\_resource\_policy) | The JSON-formatted resource-based policy to apply to the DynamoDB table | `string` | `""` | no |
| <a name="input_stream_enabled"></a> [stream\_enabled](#input\_stream\_enabled) | Indicates whether Streams are to be enabled | `bool` | `false` | no |
| <a name="input_stream_view_type"></a> [stream\_view\_type](#input\_stream\_view\_type) | When an item in the table is modified, StreamViewType determines what information is written to the table's stream | `string` | `""` | no |
| <a name="input_table_name"></a> [table\_name](#input\_table\_name) | Name of the DynamoDB table (if empty, will use project-environment pattern) | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags for all resources | `map(string)` | `{}` | no |
| <a name="input_ttl_attribute_name"></a> [ttl\_attribute\_name](#input\_ttl\_attribute\_name) | The name of the table attribute to store the TTL timestamp in | `string` | `""` | no |
| <a name="input_ttl_enabled"></a> [ttl\_enabled](#input\_ttl\_enabled) | Indicates whether TTL is enabled | `bool` | `false` | no |

## Outputs

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gsi_names"></a> [gsi\_names](#output\_gsi\_names) | Names of the configured global secondary indexes |
| <a name="output_lsi_names"></a> [lsi\_names](#output\_lsi\_names) | Names of the configured local secondary indexes |
| <a name="output_stream_arn"></a> [stream\_arn](#output\_stream\_arn) | The ARN of the DynamoDB stream |
| <a name="output_stream_label"></a> [stream\_label](#output\_stream\_label) | The label of the DynamoDB stream |
| <a name="output_table_arn"></a> [table\_arn](#output\_table\_arn) | The ARN of the DynamoDB table |
| <a name="output_table_class"></a> [table\_class](#output\_table\_class) | The storage class of the DynamoDB table |
| <a name="output_table_id"></a> [table\_id](#output\_table\_id) | The ID of the DynamoDB table |
| <a name="output_table_name"></a> [table\_name](#output\_table\_name) | The name of the DynamoDB table |
| <a name="output_table_stream_arn"></a> [table\_stream\_arn](#output\_table\_stream\_arn) | The ARN of the Table Stream |
| <a name="output_table_stream_label"></a> [table\_stream\_label](#output\_table\_stream\_label) | A timestamp, in ISO 8601 format, for the stream when it was enabled |
<!-- END_TF_DOCS -->