resource "aws_instance" "test" {
  ami = "ami-0022f774911c1d690"
  instance_type  = "t2.micro"
  key_name = "terraform"
}