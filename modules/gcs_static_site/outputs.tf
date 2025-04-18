output "bucket_name" {
  description = "The name of the bucket"
  value       = google_storage_bucket.static_site.name
}

output "bucket_url" {
  description = "Public URL of the bucket"
  value       = "https://storage.googleapis.com/${google_storage_bucket.static_site.name}/index.html"
}
