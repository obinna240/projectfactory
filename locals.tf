locals {
  gcs_name          = "airbnb-osky"
  ghaprovider       = "gha-provider"
  gha_display_name  = "GitHub Actions Provider"
  github_repository = "Randomiser"
  org               = "obinna240"
  repo_id           = 965171141
  schema_files = {
    "hosts"    = "${path.root}/resources/hosts.json"
    "listings" = "${path.root}/resources/listings.json"
  }
  airbnb_files = [
    "hosts",
    "listings"
  ]
  airbnb_file_paths = {
    for name, rel_path in var.airbnb_files : name => "${path.root}/${rel_path}"
  }
}

