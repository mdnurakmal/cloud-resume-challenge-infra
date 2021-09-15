# Create a service account
resource "google_service_account" "cloud_resume_challenge_worker" {
  account_id   = "crc-worker-id"
  display_name = "Cloud Resume Challenge Worker"
}

# Set permissions
resource "google_project_iam_binding" "serviceAccountKeyAdmin_permissions" {

  role       = "roles/iam.serviceAccountKeyAdmin"
  members    = [local.cloud_resume_challenge_worker_sa,$MEMBER]
  depends_on = [google_service_account.cloud_resume_challenge_worker]
}

# Set permissions
resource "google_project_iam_binding" "serviceAccountUser_permissions" {
 
  role       = "roles/iam.serviceAccountUser"
  members    = [local.cloud_resume_challenge_worker_sa,$MEMBER]
  depends_on = [google_project_iam_binding.serviceAccountKeyAdmin_permissions]
}

# Set permissions
resource "google_project_iam_binding" "cloudfunctions_permissions" {

  role       = "roles/cloudfunctions.admin"
  members    = [local.cloud_resume_challenge_worker_sa,$MEMBER]
  depends_on = [google_project_iam_binding.serviceAccountUser_permissions]
}
