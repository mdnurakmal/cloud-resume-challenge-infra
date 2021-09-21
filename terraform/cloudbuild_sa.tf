resource "google_project_iam_binding" "cloudbuild_permmisions" {

  role = "roles/storage.admin"

  members = [local.cloud_build_sa]
  depends_on = [google_project_iam_binding.storage_permmisions]
}

