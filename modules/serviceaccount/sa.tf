resource "google_service_account" "githubactions_identity_sa" {
  account_id   = "githubactions-identity-sa"
  display_name = "Workload Identity Service Account"
  project      = var.project_id
}

resource "google_project_iam_binding" "workload_identity_binding" {
  project = var.project_id

  role = "roles/iam.workloadIdentityUser"
  members = [
    "serviceAccount:${google_service_account.githubactions_identity_sa.email}",
  ]
}

#  Create Workload Identity Pool
resource "google_iam_workload_identity_pool" "gha_pool" {
  project                   = var.project_id
  display_name              = "GHA workload id pool"
  workload_identity_pool_id = "github-actions-pool"
  description               = "Identity pool for automated test"
}

resource "google_iam_workload_identity_pool_provider" "github_provider" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.gha_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = local.ghaprovider
  project                            = var.project_id
  display_name                       = local.gha_display_name
  description                        = "GitHub Actions identity pool provider for automated test"
  attribute_condition                = <<EOT
    assertion.repository_owner_id == "965171141" &&
    attribute.repository == "obinna240/Randomiser" &&
    assertion.ref == "refs/heads/master" &&
    assertion.ref_type == "branch"
EOT
  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository" = "assertion.repository"
  }
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}