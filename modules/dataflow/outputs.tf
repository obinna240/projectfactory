output "bucket_name" {
  value       = google_storage_bucket.dataflow.name
  description = "Name of the Dataflow staging and temp bucket"
}
