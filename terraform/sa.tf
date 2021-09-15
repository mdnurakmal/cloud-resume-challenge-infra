# Create a service account
resource "google_service_account" "cloud_resume_challenge_worker" {
  account_id   = "crc-worker-id"
  display_name = "Cloud Resume Challenge Worker"
}


resource "google_project_iam_binding" "admin-account-iam" {

  role = "roles/iam.serviceAccountUser"

  members = [local.cloud_resume_challenge_worker_sa]
  depends_on = [google_service_account.cloud_resume_challenge_worker]
}

resource "google_project_iam_binding" "cloudfunctions_permissions" {
  role = "roles/cloudfunctions.developer"

  members = [local.cloud_resume_challenge_worker_sa]
  depends_on = [google_project_iam_binding.admin-account-iam]
}



