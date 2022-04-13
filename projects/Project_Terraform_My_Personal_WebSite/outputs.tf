output "publicip" {
  value = aws_instance.Personal_Website.public_ip

}

# output "s3" {
#   value = aws_s3_bucket.Website_Bucket.dns_name

# }