terraform {
  backend "gcs" {
    bucket = "innovation-ctt-tfstate"
    prefix = "terraform/bootstrap/state"
  }
}
