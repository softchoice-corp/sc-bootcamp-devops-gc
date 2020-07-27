terraform {
  backend "gcs" {
    bucket = "sc-gc-devops-bootcamp-tfstate"
    prefix = "terraform/bootstrap/state"
  }
}