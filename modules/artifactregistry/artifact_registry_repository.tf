resource "google_artifact_registry_repository" "docker_repo" {
  project       = var.project_id
  location      = var.region
  repository_id = "repo1"

  description = "Docker repository for application container images"

  format = "DOCKER"
  mode   = "STANDARD_REPOSITORY"

  docker_config {
    immutable_tags = true
  }

  labels = {
    managed_by = "terraform"
    purpose    = "container-images"
  }

}

resource "google_artifact_registry_repository_iam_member" "app" {
  for_each = local.artifact_registry_roles

  project    = var.project_id
  location   = var.region
  repository = google_artifact_registry_repository.docker_repo.repository_id
  role       = each.value
  member     = "serviceAccount:${var.service_account_email}"
}