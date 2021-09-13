
terraform {
  backend "gcs" {
    bucket  = "cloud-resume-challenge-bucket"
    prefix  = "terraform/state"
  }

}