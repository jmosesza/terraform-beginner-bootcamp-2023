terraform {
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "jmosesza"

  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
  #cloud {
  #  organization = "jmosesza"
  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
}

module "terrahome_aws" {
  source = "./modules/terrahome_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}