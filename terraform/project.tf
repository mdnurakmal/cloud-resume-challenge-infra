
resource "google_project_service" "iam" {
  service = "iam.googleapis.com"
  disable_on_destroy = true
}

resource "google_project_service" "cloudbuild" {
  service = "cloudbuild.googleapis.com"
  disable_on_destroy = true
}

resource "google_project_service" "cloudresourcemanager" {
  service = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = true
}

resource "google_project_service" "run" {
  service = "run.googleapis.com"
  disable_on_destroy = true
}

resource "google_app_engine_application" "app" {

  database_type = "CLOUD_FIRESTORE"
  location_id = var.region
}

resource "google_firestore_index" "counter" {

  collection = "counter"

  fields {
    field_path = "counter"
    order      = "ASCENDING"
  }
}