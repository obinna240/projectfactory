#create airbnb dataset
resource "google_bigquery_dataset" "airbnb" {
  dataset_id  = "airbnb"
  location    = "europe-west4"
  description = "Airbnb reviews, hosts and listings "
}

# storage bucket object
resource "google_storage_bucket_object" "csv_objects" {
  for_each = var.airbnb_files
  name     = each.key
  bucket   = google_storage_bucket.airbnb_dbt_work_bucket.name
  source   = "${path.module}/${each.value}"
}

# write to bq
resource "google_bigquery_table" "airbnb_dbt_tables" {
  for_each = local.schema_files

  dataset_id = google_bigquery_dataset.airbnb.dataset_id
  table_id   = "${each.key}.csv"

  schema = file("${path.module}/${each.value}")

  external_data_configuration {
    source_uris = [
      "gs://${google_storage_bucket.airbnb_dbt_work_bucket.name}/${each.key}.csv"
    ]
    source_format = "CSV"
    autodetect    = false # Disable autodetect because we are using the schema from the JSON
    field_delimiter = ","
    skip_leading_rows = 1
  }
}