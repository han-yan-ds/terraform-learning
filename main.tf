// variables
variable "aws_region" {
    default = "us-west-2"
}
variable "role_arn" {
    default = "arn:aws:iam::182162384657:role/NonProd_MLDataPipelines_DevUsers"
}


// providers
provider "aws" {
    region = var.aws_region
    profile = "mlp-prod"
}


// resources
resource "aws_dynamodb_table" "hello_terraform_dynamo_table" {
    name = "hello-dynamo-table"
    hash_key = "PersonId"
    write_capacity = 5
    read_capacity = 5
    attribute {
        name = "PersonId"
        type = "N"
    }
    attribute {
        name = "FirstName"
        type = "S"
    }    
    attribute {
        name = "LastName"
        type = "S"
    }

    global_secondary_index {
      name = "FirstNameIndex"
      hash_key = "FirstName"
      projection_type = "INCLUDE"
      write_capacity = 5
      read_capacity = 5
      non_key_attributes = ["PersonId", "LastName", "Age", "Profession"]
    }

    global_secondary_index {
      name = "LastNameIndex"
      hash_key = "LastName"
      projection_type = "INCLUDE"
      write_capacity = 5
      read_capacity = 5
      non_key_attributes = ["PersonId", "FirstName", "Age", "Profession"]
    }
}

resource "aws_dynamodb_table_item" "hanyan" {
    table_name = aws_dynamodb_table.hello_terraform_dynamo_table.name
    hash_key = aws_dynamodb_table.hello_terraform_dynamo_table.hash_key

    item = <<ITEM
    {
        "PersonId": {"N": "31452"},
        "FirstName": {"S": "Han"},
        "LastName": {"S": "Yan"},
        "Age": {"N": "732"},
        "Profession": {"S": "Nerd"}
    }
    ITEM
}


// output
output "dynamo_table_arn" {
    value = aws_dynamodb_table.hello_terraform_dynamo_table.arn
}

output "dynamo_table_id" {
    value = aws_dynamodb_table.hello_terraform_dynamo_table.id
}
