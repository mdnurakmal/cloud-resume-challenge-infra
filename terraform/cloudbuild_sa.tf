resource "google_project_iam_binding" "cloudbuild_sa_permissions" {

  role = "roles/storage.admin"

  members = [local.cloud_build_sa]
}

