<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a id="readme-top"></a>

<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![Unlicense License][license-shield]][license-url]

<br />

<!-- PROJECT LOGO -->
<div align="center">
  <a href="https://github.com/telekom-mms/terraform-aws-dynamodb">
    <img src="logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">AWS DynamoDB Module</h3>

  <p align="center">
    PSA-compliant DynamoDB module with mandatory PITR, deletion protection, and KMS encryption.
    <br />
    <a href="https://github.com/telekom-mms/terraform-aws-dynamodb"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/telekom-mms/terraform-aws-dynamodb">View Demo</a>
    ·
    <a href="https://github.com/telekom-mms/terraform-aws-dynamodb/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    ·
    <a href="https://github.com/telekom-mms/terraform-aws-dynamodb/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
  </p>
</div>

## Documentation

Full auto-generated documentation of inputs, outputs, and resources: [TERRAFORM-DOCS.md](TERRAFORM-DOCS.md)

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#security-features">Security Features</a></li>
    <li><a href="#psa-compliance-features">PSA Compliance Features</a></li>
    <li><a href="#outputs">Outputs</a></li>
    <li><a href="#troubleshooting">Troubleshooting</a></li>
    <li><a href="#license">License</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

This module creates PSA-compliant DynamoDB tables with a focus on data durability and access control. It defaults to the most secure configurations, such as Point-In-Time Recovery (PITR) and deletion protection.

### Features

- **Serverless Scaling**: Defaulted to `PAY_PER_REQUEST` billing mode for cost efficiency.
- **Data Protection**: Mandatory PITR and Deletion Protection enabled by default.
- **KMS Encryption**: Support for customer-managed KMS keys for encryption at rest.
- **Global & Local Indexes**: Simplified configuration for GSI and LSI resources.
- **Resource Policies**: Native support for DynamoDB resource-based access control.
- **TTL Support**: Built-in Time-to-Live configuration for automatic data expiration.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE -->
## Usage

### Basic Usage

```hcl
module "dynamodb" {
  source = "./terraform-aws-dynamodb"

  project_name = "myapp"
  environment  = "prod"
  
  hash_key  = "UserId"
  range_key = "OrderDate"
  
  attributes = [
    { name = "UserId", type = "S" },
    { name = "OrderDate", type = "N" }
  ]
}
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SECURITY FEATURES -->
## Security Features

- **Point-In-Time Recovery**: Enables 35 days of continuous backups for disaster recovery.
- **Deletion Protection**: Prevents the table from being deleted via console or API without explicit reconfiguration.
- **Encryption at Rest**: Mandatory server-side encryption using AWS managed keys or customer CMKs.
- **Resource Policies**: Allows defining granular access control directly on the table resource.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- PSA COMPLIANCE FEATURES -->
## PSA Compliance Features

This module implements the following PSA compliance features (referencing `05-Strukturierte_PSA_Anforderungen_DB_Hadoop_LLM.pdf`):

### Security Controls

- **Req 3.50-01 (Encryption)**: KMS encryption mandatory for data at rest.
- **Req 3.01-02 (Data Integrity)**: PITR enabled by default.
- **Req 3.69 (Access Control)**: Support for `resource_policy` to enforce least privilege.
- **Deletion Protection**: Enforced to prevent accidental data loss.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- TROUBLESHOOTING -->
## Troubleshooting

### Resource Policy Errors

- Ensure the JSON policy is valid and references the correct principals.
- Remember that resource-based policies for DynamoDB are a relatively new feature; ensure your AWS provider version is up to date.

### Throughput Issues

- If using `PROVISIONED` mode, monitor CloudWatch metrics for `ReadThrottleEvents` and `WriteThrottleEvents`.
- Consider switching to `PAY_PER_REQUEST` for unpredictable workloads.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/telekom-mms/terraform-aws-dynamodb.svg?style=for-the-badge
[contributors-url]: https://github.com/telekom-mms/terraform-aws-dynamodb/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/telekom-mms/terraform-aws-dynamodb.svg?style=for-the-badge
[forks-url]: https://github.com/telekom-mms/terraform-aws-dynamodb/network/members
[stars-shield]: https://img.shields.io/github/stars/telekom-mms/terraform-aws-dynamodb.svg?style=for-the-badge
[stars-url]: https://github.com/telekom-mms/terraform-aws-dynamodb/stargazers
[issues-shield]: https://img.shields.io/github/issues/telekom-mms/terraform-aws-dynamodb.svg?style=for-the-badge
[issues-url]: https://github.com/telekom-mms/terraform-aws-dynamodb/issues
[license-shield]: https://img.shields.io/github/license/telekom-mms/terraform-aws-dynamodb.svg?style=for-the-badge
[license-url]: https://github.com/telekom-mms/terraform-aws-dynamodb/blob/master/LICENSE.txt

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_resource_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_resource_policy) | resource |
| [aws_dynamodb_table.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attributes"></a> [attributes](#input\_attributes) | List of nested attribute definitions. Only required for hash\_key and range\_key attributes | <pre>list(object({<br/>    name = string<br/>    type = string<br/>  }))</pre> | n/a | yes |
| <a name="input_billing_mode"></a> [billing\_mode](#input\_billing\_mode) | Controls how you are charged for read and write throughput and how you manage capacity (PROVISIONED or PAY\_PER\_REQUEST) | `string` | `"PAY_PER_REQUEST"` | no |
| <a name="input_deletion_protection_enabled"></a> [deletion\_protection\_enabled](#input\_deletion\_protection\_enabled) | Whether to enable deletion protection for the table | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g., prod, dev, test) | `string` | n/a | yes |
| <a name="input_global_secondary_indexes"></a> [global\_secondary\_indexes](#input\_global\_secondary\_indexes) | Describe a GSI for the table | <pre>list(object({<br/>    name               = string<br/>    hash_key           = string<br/>    range_key          = optional(string)<br/>    projection_type    = string<br/>    non_key_attributes = optional(list(string))<br/>    read_capacity      = optional(number)<br/>    write_capacity     = optional(number)<br/>  }))</pre> | `[]` | no |
| <a name="input_hash_key"></a> [hash\_key](#input\_hash\_key) | The attribute to use as the hash (partition) key | `string` | n/a | yes |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | The ARN of the KMS key to use for server-side encryption | `string` | `""` | no |
| <a name="input_local_secondary_indexes"></a> [local\_secondary\_indexes](#input\_local\_secondary\_indexes) | Describe an LSI for the table | <pre>list(object({<br/>    name               = string<br/>    range_key          = string<br/>    projection_type    = string<br/>    non_key_attributes = optional(list(string))<br/>  }))</pre> | `[]` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Prefix for resource names (if not provided, will use project-environment pattern) | `string` | `""` | no |
| <a name="input_point_in_time_recovery_enabled"></a> [point\_in\_time\_recovery\_enabled](#input\_point\_in\_time\_recovery\_enabled) | Whether to enable point-in-time recovery | `bool` | `true` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project | `string` | n/a | yes |
| <a name="input_range_key"></a> [range\_key](#input\_range\_key) | The attribute to use as the range (sort) key | `string` | `null` | no |
| <a name="input_resource_policy"></a> [resource\_policy](#input\_resource\_policy) | The JSON-formatted resource-based policy to apply to the DynamoDB table | `string` | `""` | no |
| <a name="input_stream_enabled"></a> [stream\_enabled](#input\_stream\_enabled) | Indicates whether Streams are to be enabled | `bool` | `false` | no |
| <a name="input_stream_view_type"></a> [stream\_view\_type](#input\_stream\_view\_type) | When an item in the table is modified, StreamViewType determines what information is written to the table's stream | `string` | `""` | no |
| <a name="input_table_name"></a> [table\_name](#input\_table\_name) | Name of the DynamoDB table (if empty, will use project-environment pattern) | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags for all resources | `map(string)` | `{}` | no |
| <a name="input_ttl_attribute_name"></a> [ttl\_attribute\_name](#input\_ttl\_attribute\_name) | The name of the table attribute to store the TTL timestamp in | `string` | `""` | no |
| <a name="input_ttl_enabled"></a> [ttl\_enabled](#input\_ttl\_enabled) | Indicates whether TTL is enabled | `bool` | `false` | no |

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