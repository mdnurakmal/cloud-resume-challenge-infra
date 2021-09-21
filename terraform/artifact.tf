resource "google_artifact_registry_repository" "my-repo" {
  provider = google-beta
  project = local.project
  location = var.region
  repository_id = "cloud-resume-challenge"
  description = "cloud-resume-challenge"
  format = "DOCKER"
}