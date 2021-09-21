resource "google_project_iam_binding" "cloudbuild_sa_permissions" {

  role = "roles/owner"

  members = [local.cloud_build_sa]
}

