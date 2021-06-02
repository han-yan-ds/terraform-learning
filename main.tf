// variables
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
  default = "us-west-2"
}


// providers
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = var.aws_region
#   assume_role {
#     role_arn = "arn:aws:sts::182162384657:assumed-role/NonProd_MLDataPipelines_DevUsers"
#   }
}


// resources
resource "aws_instance" "hello_terraform_ec2" {
    ami = "ami-830c94e3"
    instance_type = "t2.micro"
}


// output
output "aws_public_ip" {
    value = aws_instance.hello_terraform_ec2.public_dns
}
