terraform {
  backend "gcs" {
    bucket = "sc-gc-lab-terraform-state"
    prefix = "terraform/bootstrap/state"
  }
}