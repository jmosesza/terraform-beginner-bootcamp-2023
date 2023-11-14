output "bucket_name" {
  description = "Bucket name for our static website hosting"
  value = module.terrahome_aws.bucket_name  
}

output "s3_website_endpoint" {
  description = "S3 Static Website hosting endpoint"
  value = module.terrahome_aws.website_endpoint
}

output "cloudfront_url" {
  description = "The CloudFront Distribution Domain Name"
  value = module.terrahome_aws.cloudfront_url
}

#output "cloudfront_distribution_id" {
#  value = module.terrahome_aws.cloudfront_distribution_id
#}
