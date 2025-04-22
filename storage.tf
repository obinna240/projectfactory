resource "google_storage_bucket" "airbnb_dbt_work_bucket" {
  name     = "airbnb-osky"
  location = var.region
}

#copy objects to the storage bucket
resource "google_storage_bucket_object" "csv_objects" {
  for_each = var.airbnb_files
  name   = each.key
  bucket = google_storage_bucket.airbnb_dbt_work_bucket.name
  source = "${path.module}/${each.value}"
}




