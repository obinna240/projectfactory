#gcloud storage buckets create gs://tf-state-gcs-oskylala \
#  --location=EU \
#  --uniform-bucket-level-access

#gsutil mb -l europe-west4 gs://tf-state-gcs-oskylala-new/

#load data from local file to gcs
gcloud storage cp /reviews.csv" gs://airbnb-osky