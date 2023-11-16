variable "teacherseat_user_uuid" {
 type = string
}

variable "terratowns_endpoint" {
 type = string
}

variable "terratowns_access_token" {
 type = string
}

#variable "bucket_name" {
# type = string
#}

#variable "index_html_filepath" {
# type = string
#}

#variable "error_html_filepath" {
# type = string
#}

#variable "content_version" {
#    type        = number
#}

#variable "public_path" {
#   type        = string
#}

#variable "assets_path" {
#    description = "Path to assets folder"
#    type        = string
#}

#variable "root_path" {
#  type        = string
#  description = "root_path"
#}

variable "arcanum" {
  type = object({
    public_path = string
    content_version = number
  })
}

variable "scblacklist" {
  type = object({
    public_path = string
    content_version = number
  })
}
