// examples/dynamodb-basic/main.tf

provider "aws" {
  region = "eu-central-1"
}

module "dynamodb" {
  source = "../../"

  project_name = var.project_name
  environment  = var.environment

  hash_key = "id"

  attributes = [
    {
      name = "id"
      type = "S"
    }
  ]

  tags = var.tags
}
