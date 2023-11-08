terraform {
   required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
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

provider "terratowns" {
  #endpoint = var.terratowns_endpoint
  #user_uuid = var.teacherseat_user_uuid
  #token = var.terratowns_access_token
  endpoint = "http://localhost:4567"
  user_uuid="e328f4ab-b99f-421c-84c9-4ccea042c7d1" 
  token="9b49b3fb-b8e9-483c-b703-97ba88eef8e0"
}


#module "terrahome_aws" {
#  source = "./modules/terrahome_aws"
#  user_uuid = var.user_uuid
#  bucket_name = var.bucket_name
#  index_html_filepath = var.index_html_filepath
#  error_html_filepath = var.error_html_filepath
  #index_html_filepath = "${path.root}${var.index_html_filepath}"
  #error_html_filepath = "${path.root}${var.error_html_filepath}"
# assets_path = var.assets_path
#  content_version = var.content_version
#  root_path = var.root_path
#}
