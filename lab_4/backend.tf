terraform {
  backend "gcs" {
    bucket = "master-smithy-283514-tfstate"
    prefix = "terraform/state/lab4"
  }
}