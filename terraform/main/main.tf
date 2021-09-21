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


locals {
  project = data.google_project.project.project_id
  project_number = data.google_project.project.number
  service_name   = "cloud-resume-challenge"
  cloud_resume_challenge_worker_sa  = "serviceAccount:${google_service_account.cloud_resume_challenge_worker.email}"
  cloud_build_sa ="google_project.project.number@cloudbuild.gserviceaccount.com"
}



# Create app engine application if it doesnt exists
resource "google_app_engine_application" "app" {
  project = local.project
  database_type = "CLOUD_FIRESTORE"
  location_id = var.region
}
