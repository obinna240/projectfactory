output "bucket_name" {
  value       = google_storage_bucket.airbnb_dbt_work_bucket.name
  description = "Name of the Airbnb working bucket"
}
