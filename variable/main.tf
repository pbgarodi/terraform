terraform {
  required_providers {
      aws = {
          source = "hashicorp/aws"
          version = "4.15.1"
      }
  }
}


provider "aws" {
    shared_config_files = ["~/.aws/config"]
    shared_credentials_files = ["~/.aws/credentials"]
    region = "us-east-1"
}

# provider "aws" {
#   shared_config_files = ["~/.aws/config"]
#   shared_credentials_files = ["~/.aws/credentials"]
#   region = "us-east-1"
# }

variable "image_id" {
  type = string
  sensitive = true
  default = "ami-0022f774911c1d690"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
  default = "terraform"
}
resource "aws_instance" "variable_demo" {
  ami = var.image_id
  instance_type = var.instance_type
  key_name = var.key_name

}

output "public_id" {
  value = aws_instance.variable_demo.public_ip
}

output "public_dns" {
  value = aws_instance.variable_demo.public_dns
}

output "instance_id" {
  value = aws_instance.variable_demo.arn
}