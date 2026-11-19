moved {
  from = google_storage_bucket.airbnb_dbt_work_bucket
  to   = module.storage.google_storage_bucket.airbnb_dbt_work_bucket
}

moved {
  from = google_storage_bucket_object.csv_objects
  to   = module.storage.google_storage_bucket_object.csv_objects
}

moved {
  from = google_bigquery_dataset.airbnb
  to   = module.bigquery.google_bigquery_dataset.airbnb
}

moved {
  from = google_bigquery_table.airbnb_dbt_tables
  to   = module.bigquery.google_bigquery_table.airbnb_dbt_tables
}

import {
  to = module.serviceaccount.google_iam_workload_identity_pool.gha_pool
  id = "projects/compute-1-367804/locations/global/workloadIdentityPools/github-actions-pool"
}

import {
  to = module.serviceaccount.google_iam_workload_identity_pool_provider.github_provider
  id = "projects/compute-1-367804/locations/global/workloadIdentityPools/github-actions-pool/providers/gha-provider"
}
