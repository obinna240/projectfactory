variable "region" {
  type        = string
  description = "GCS bucket location"
}

variable "airbnb_files" {
  type        = map(string)
  description = "Map of object names to absolute CSV file paths"
}
