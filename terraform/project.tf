
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

resource "google_project_service" "firestore" {
  service = "firestore.googleapis.com"
  disable_on_destroy = true
}

resource "google_project_service" "appengine" {
  service = "appengine.googleapis.com"
  disable_on_destroy = true
}

resource "google_app_engine_application" "app" {
  project = local.project
  database_type = "CLOUD_FIRESTORE"
  location_id = var.region

  depends_on = [google_project_service.appengine,google_project_service.firestore]
}
