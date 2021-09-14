# Create a service account
resource "google_service_account" "cloud_resume_challenge_worker" {
  account_id   = "crc-worker-id"
  display_name = "Cloud Resume Challenge Worker"
}

# Set permissions
resource "google_project_iam_binding" "service_permissions" {

  role       = "roles/iam.serviceAccountKeyAdmin"
  members    = [local.cloud_resume_challenge_worker_sa]
  depends_on = [google_service_account.cloud_resume_challenge_worker]
}

