packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

# variables -----------------------------------------------------------------
variable "ami_prefix" {
  type    = string
  default = "ansible-role-wp-mb"
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

# Sourcces ---------------------------------------------------------------------
source "amazon-ebs" "ubuntu-focal" {
  ami_name      = "${var.ami_prefix}-focal-${local.timestamp}"
  instance_type = "t2.micro"
  region        = "eu-west-3"
  subnet_id = "subnet-09d30643468e563bb"
  force_deregister = true
  force_delete_snapshot = true
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

# construction ---------------------------------------------------------------------
build {
  name    = "learn-packer"
  sources = [
    "source.amazon-ebs.ubuntu-focal"
  ]

  provisioner "ansible" {
    playbook_file = "../main.yml"
    user = "ubuntu"
    extra_arguments = [ "-vvvv" ]

  }

  post-processor "manifest" {
    output = "manifest.json"
    strip_path = true
  }
  
}