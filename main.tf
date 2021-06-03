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
resource "aws_instance" "hello_terraform_ec2" {
    ami = "ami-830c94e3"
    instance_type = "t2.micro"
    subnet_id = "subnet-0e653d56988750483"
}


// output
output "aws_public_ip" {
    value = aws_instance.hello_terraform_ec2.public_dns
}
