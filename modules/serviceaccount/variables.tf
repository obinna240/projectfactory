variable "project_id" {
  type        = string
  description = "GCP project id"
}

variable "ghaprovider" {
  type        = string
  description = "Workload identity pool provider id"
}

variable "gha_display_name" {
  type        = string
  description = "Workload identity pool provider display name"
}
