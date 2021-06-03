// variables
variable "aws_access_key" {
    description = "The AWS Access Key, (in env.auto.tfvars separately)"
}
variable "aws_secret_key" {
    description = "The AWS Secret Access Key, (in env.auto.tfvars separately)"
}
variable "aws_region" {
    default = "us-west-2"
}
variable "role_arn" {
    default = "arn:aws:iam::182162384657:role/NonProd_MLDataPipelines_DevUsers"
}


// providers
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = var.aws_region
  assume_role {
    role_arn = var.role_arn
  }
}


// resources
resource "aws_instance" "hello_terraform_ec2" {
    ami = "ami-830c94e3"
    instance_type = "t2.micro"
    subnet_id = "subnet-0e653d56988750483"
}


// output
output "aws_public_ip" {
    value = aws_instance.hello_terraform_ec2.public_dns
}
