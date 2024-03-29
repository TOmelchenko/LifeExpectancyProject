locals {
  data_lake_bucket = "life_expectancy"
}

variable "project" {
  description = "dataengproject"
}

variable "region" {
  description = "Region for GCP resources. Choose as per your location: https://cloud.google.com/about/locations"
  default = "europe-west1"
  type = string
}

variable "storage_class" {
  description = "Storage class type for your bucket. Check official docs for more info."
  default = "STANDARD"
}

variable "BQ_DATASET" {
  description = "BigQuery Dataset that raw data (from GCS) will be written to"
  type = string
  default = "life_expectancy"
}

##variable "credentials" {
##  default = "${file("/Users/tetianaomelchenko/Documents/Tanya/Learning/DataLearn/DataEngZoomCamp2024/LifeExpectancyProject/dataengproject-417719-a6a2d06410da.json")}"
##}
##variable "TABLE_NAME" {
##  description = "BigQuery Table"
##  type = string
##  default = "data_row_all"
##}