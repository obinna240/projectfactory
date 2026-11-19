resource "google_storage_bucket" "dataflow" {
  name     = "${var.project_id}-dataflow"
  location = var.region

  uniform_bucket_level_access = true
  force_destroy               = true

  lifecycle_rule {
    condition {
      age = 7
    }
    action {
      type = "Delete"
    }
  }
}
