module "terraform_init" {
  source = "../modules/plugins"
}

module "credentials" {
  source = "../modules/aws_cred"
}

module "ec2" {
  source = "../modules/ec2"
}