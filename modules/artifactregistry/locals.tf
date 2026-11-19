locals {
  artifact_registry_roles = toset([
    "roles/artifactregistry.reader",
    "roles/artifactregistry.writer",
  ])
}