terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"  
    }
  }
}

provider "google" {
  project = var.project_id  
  region  = "us-central1"   
}

resource "google_storage_bucket" "static_site" {
  name                        = var.bucket_name
  location                    = var.location
  project                     = var.project_id  
  force_destroy               = var.force_destroy
  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
  }

  versioning {
    enabled = true
  }

  labels = var.labels
}

resource "google_storage_bucket_iam_member" "public_read" {
  bucket = google_storage_bucket.static_site.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}


resource "google_storage_bucket_object" "index_html" {
  name         = "index.html"
  bucket       = google_storage_bucket.static_site.name
  source       = "./index.html"  
  content_type = "text/html"
}
