output "bucket_name" {
  value = aws_s3_bucket.website_bucket.bucket
}

output "website_endpoint" {
  description = "website endpoint for the statically hosted website"
  value       = aws_s3_bucket_website_configuration.website_configuration.website_endpoint
}

output "domain_name" {
  description = "The CloudFront distribution domain name"
  value = aws_cloudfront_distribution.s3_distribution.domain_name
 }

#output "cloudfront_distribution_id" {
#  value = aws_cloudfront_distribution.s3_distribution.id
#}

#output "website_endpoint" {
#  value = aws_s3_bucket_website_configuration.website_configuration.website_endpoint
#}


#output "bucket_name" {
#  description = "Bucket name for our static website hosting"
#  value = module.home_arcanum_hosting.bucket_name
#}

#output "s3_website_endpoint" {
#  description = "S3 Static Website hosting endpoint"
#  value = module.home_arcanum_hosting.website_endpoint
#}

#output "cloudfront_url" {
#  description = "The CloudFront Distribution Domain Name"
#  value = module.home_arcanum_hosting.domain_name
#}
