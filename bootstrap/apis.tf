resource "google_project_service" "apis" {
  for_each = toset([
    "compute.googleapis.com",
    "dataflow.googleapis.com",
    "pubsub.googleapis.com"
  ])

  project            = var.project_id
  service            = each.value
  disable_on_destroy = false
}
