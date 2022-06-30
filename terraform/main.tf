terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-3"
}
/*
data "aws_ami" "image" {
  most_recent = true
  owners = ["self"]
  name_regex = var.instance_name
}
*/
resource "aws_instance" "app_server" {
  ami           = "${var.ami_id}"
  //ami           = "${data.aws_ami.image.id}"
  instance_type = "t2.micro"
  subnet_id = "subnet-09d30643468e563bb"
  security_groups = ["sg-0bdcb23a2e04b7a2d"]
  tags = {
    Name = var.instance_name
  }
}

