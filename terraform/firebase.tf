resource "google_firebase_project" "default" {
  provider = google-beta
  project  = google_project.project.project_id
}