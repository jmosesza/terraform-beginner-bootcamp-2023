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
  #endpoint = "http://localhost:4567"
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token =var.terratowns_access_token
}

module "terrahome_aws" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  bucket_name = var.bucket_name
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  #index_html_filepath = "${path.root}${var.index_html_filepath}"
  #error_html_filepath = "${path.root}${var.error_html_filepath}"
  assets_path = var.assets_path
  content_version = var.content_version
  root_path = var.root_path
}

resource "terratowns_home" "home" {
  name = "How to play Arcanum in 2023!"
  description = <<DESCRIPTION
Arcanum is a game from 2001 that shipped with alot of bugs.
Modders have removed all the originals making this game really fun
to play (despite that old look graphics). This is my guide that will
show you how to play arcanum without spoiling the plot.
DESCRIPTION
  #domain_name = module.home_arcanum_hosting.domain_name
  #town = "missingo"
  #content_version = var.arcanum.content_version
  domain_name = module.terrahome_aws.cloudfront_url
  #domain_name = "3fdq3gz.cloudfront.net"
  town = "missingo"
  content_version = 1
}