terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.53"
    }
  }

    backend "gcs" {
    bucket  = "cloud-resume-challenge-bucket"
    prefix  = "terraform/state"
  }

}

provider "google" {}

data "google_project" "project" {
}