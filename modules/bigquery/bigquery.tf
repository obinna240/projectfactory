#create airbnb dataset
resource "google_bigquery_dataset" "airbnb" {
  dataset_id  = "airbnb"
  location    = "europe-west4"
  description = "Airbnb reviews, hosts and listings "
}


# write to bq
resource "google_bigquery_table" "airbnb_dbt_tables" {
  for_each = local.schema_files

  dataset_id = google_bigquery_dataset.airbnb.dataset_id
  table_id   = each.key

  schema = file("${path.module}/${each.value}")

  external_data_configuration {
    source_uris = [
      "gs://${google_storage_bucket.airbnb_dbt_work_bucket.name}/${each.key}.csv"
    ]
    source_format = "CSV"
    autodetect    = false # Disable autodetect because we are using the schema from the JSON
    csv_options {
      field_delimiter   = ","
      quote             = ""
      skip_leading_rows = 1
    }

  }
}

#resource "google_bigquery_job" "job" {
#  for_each = toset(local.airbnb_files)
#  job_id   = "load-${each.value}"
#
#  labels = {
#    "csv_job_upload" = "airbnb_load"
#  }
#
#  load {
#    source_uris = [
#      "gs://${local.gcs_name}}/${each.value}",
#    ]
#
#    destination_table {
#      project_id = var.project_id
#      dataset_id = google_bigquery_dataset.airbnb.dataset_id
#      table_id   = each.value
#    }
#
#    skip_leading_rows     = 1
#    schema_update_options = ["ALLOW_FIELD_RELAXATION", "ALLOW_FIELD_ADDITION"]
#
#    write_disposition = "WRITE_APPEND"
#    autodetect        = true
#  }
#}