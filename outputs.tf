output "bucket_name" {
  description = "Bucket name for our static website hosting"
  value = module.terrahome_aws.bucket_name  
}