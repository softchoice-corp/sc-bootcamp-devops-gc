terraform {
  backend "gcs" {
    bucket = "PROJECT_ID-tfstate"
    prefix = "terraform/bootstrap/state"
  }
}