variable "project_id" {
  type        = string
  description = "GCP project id"
}

variable "bucket_name" {
  type        = string
  description = "GCS bucket that holds the Airbnb CSV files"
}

variable "schema_files" {
  type        = map(string)
  description = "Map of table ids to absolute schema JSON paths"
}

variable "airbnb_files" {
  type        = list(string)
  description = "Table names that have corresponding CSV objects in GCS"
}
