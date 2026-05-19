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
