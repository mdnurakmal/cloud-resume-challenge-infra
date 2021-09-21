terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.53"
    }
  }

    backend "gcs" {
  }

}


provider "google" {
  project     = var.project
  region      = var.region
}

data "google_project" "project" {
}


locals {
  project = data.google_project.project.project_id
  terraform_state_bucket = "${local.project_number}-cloud-resume-challenge-bucket"
  project_number = data.google_project.project.number
  service_name   = "cloud-resume-challenge"
  cloud_build_sa ="google_project.project.number@cloudbuild.gserviceaccount.com"
}
