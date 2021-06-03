// variables
variable "aws_region" {
    default = "us-west-2"
}
variable "role_arn" {
    default = "arn:aws:iam::182162384657:role/NonProd_MLDataPipelines_DevUsers"
}


// providers
provider "aws" {
    # shared_credentials_file = "~/.aws/credentials"
    region = var.aws_region
    profile = "mlp-prod"
}


// resources
resource "aws_s3_bucket" "hello_terraform_s3_bucket" {
    bucket = "hello-terraformed-world"
    acl = "public-read"
}


// output
output "aws_public_ip" {
    value = aws_s3_bucket.hello_terraform_s3_bucket.bucket_domain_name
}
