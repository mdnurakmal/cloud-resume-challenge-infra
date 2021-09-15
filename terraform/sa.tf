# Create a service account
resource "google_service_account" "cloud_resume_challenge_worker" {
  account_id   = "crc-worker-id"
  display_name = "Cloud Resume Challenge Worker"
}

# cloud function SA is running cloud function as a service account which requires serviceaccountuser permission
resource "google_project_iam_binding" "serviceAccountUser_permmisions" {

  role = "roles/iam.serviceAccountUser"

  members = [local.cloud_resume_challenge_worker_sa]
  depends_on = [google_service_account.cloud_resume_challenge_worker]
}

