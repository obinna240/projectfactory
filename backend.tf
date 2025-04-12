terraform {
  backend "gcs" {
    bucket = "tf-state-gcs-oskylala-new"
    prefix = "terraform/state"
  }
}