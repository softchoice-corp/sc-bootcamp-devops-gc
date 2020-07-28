terraform {
  backend "gcs" {
    bucket = "PROJECT_ID-tfstate"
    prefix = "terraform/state/lab2"
  }
}