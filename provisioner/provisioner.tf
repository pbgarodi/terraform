terraform {
  required_providers {
    aws = {
      source="hashicorp/aws"
      version="4.15.1"
    }
  }
}

provider "aws" {
  shared_config_files = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0022f774911c1d690"
  instance_type = "t1.micro"
  key_name  = "terraform"

connection {
  type= "ssh"
  host = self.public_ip
  user = "ec2-user"
  private_key = file("/home/pravin/aws_key/terraform.pem")
    }

provisioner "file" {
  source = "./nginx.sh"
  destination = "/tmp/nginx.sh"

}
provisioner "remote-exec" {
  inline = [
      "sudo chmod +x /tmp/nginx.sh",
      "cd /tmp",
      "./nginx.sh"
  ] 
}

provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }

}