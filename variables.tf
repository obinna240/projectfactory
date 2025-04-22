variable "project_id" {
  type        = string
  description = "Project id"
  default     = "compute-1-367804" #  see tfvars
}

variable "region" {
  type        = string
  description = "region"
  default     = "europe-west4"
}

variable "airbnb_files" {
  default = {
    "hosts.csv"    = "resources/hosts.csv"
    "listings.csv" = "resources/listings.csv"
#    "reviews.csv"  = "resources/reviews.csv"
  }
}
