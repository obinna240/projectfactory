provider "google" {
  project = var.project_id
  region  = var.region
}

module "storage" {
  source       = "./modules/storage"
  region       = var.region
  airbnb_files = local.airbnb_file_paths
}

module "bigquery" {
  source       = "./modules/bigquery"
  project_id   = var.project_id
  bucket_name  = module.storage.bucket_name
  schema_files = local.schema_files
  airbnb_files = local.airbnb_files
}

module "serviceaccount" {
  source           = "./modules/serviceaccount"
  project_id       = var.project_id
  ghaprovider      = local.ghaprovider
  gha_display_name = local.gha_display_name
}

module "dataflow" {
  source     = "./modules/dataflow"
  project_id = var.project_id
  region     = var.region
}

module "artifactregistry" {
  source     = "./modules/artifactregistry"
  project_id = var.project_id
  region     = var.region
}
