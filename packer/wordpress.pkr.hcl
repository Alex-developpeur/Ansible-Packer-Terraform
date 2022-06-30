packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "debian-buster" {
  ami_name      = "${var.ami_prefix}"
  instance_type = "t2.micro"
  region        = "eu-west-3"
  subnet_id = "subnet-09d30643468e563bb"
  force_deregister = true
  force_delete_snapshot = true
  source_ami_filter {
    filters = {
      name                = "debian-10-amd64-20210329-591"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["136693071363"]
  }
  ssh_username = "admin"
}

build {
  name    = "learn-packer"
  sources = [
    "source.amazon-ebs.debian-buster"
  ]

  provisioner "ansible" {
    user =  "admin"
    playbook_file = "../wordpress/deploy.yml"
  }

  post-processor "manifest" {
    output = "manifest.json"
    strip_path = true
  }
}
