provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "test_bucket" {
  name     = "test-bucket-gstarter"
  location = var.region
}

