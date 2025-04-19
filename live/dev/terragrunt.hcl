include { path = find_in_parent_folders() }

terraform {
  source = "../../modules/gcs_static_site"
}

inputs = {
  project_id    = "ahmed-jemaa"
  bucket_name   = "my-static-site-dev"
  location      = "US"
  force_destroy = true
  labels = {
    environment = "dev"
  }
}
