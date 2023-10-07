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

provider "aws" {
  # Configuration options
}

provider "random" {
  # Configuration options
}
