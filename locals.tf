locals {
  ghaprovider       = "gha-provider"
  gha_display_name  = "GitHub Actions Provider"
  github_repository = "Randomiser"
  org               = "obinna240"
  repo_id           = 965171141
  schema_files = {
    "reviews" = "resources/reviews.json",
    "hosts" = "resources/hosts.json",
    "listings" = "resources/listings.json",
  }
}

