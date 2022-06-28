variable "instanceType" {
  
}

module "terraform_init" {
  source = "../modules/plugins"
}

module "credentials" {
  source = "../modules/aws_cred"
}

module "ec2" {
  instanceType = var.instanceType
  source = "../modules/ec2"
}