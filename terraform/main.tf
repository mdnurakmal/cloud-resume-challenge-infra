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



# Create app engine application if it doesnt exists
resource "google_app_engine_application" "app" {
  project = local.project
  database_type = "CLOUD_FIRESTORE"
  location_id = var.region
}
