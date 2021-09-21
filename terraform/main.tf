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
  project_number = data.google_project.project.number
  service_name   = "cloud-resume-challenge"
  cloud_build_sa ="serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
}
