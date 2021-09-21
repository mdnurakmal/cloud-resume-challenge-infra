#enable all necessary apis

resource "google_project_service" "iam" {
  service = "iam.googleapis.com"
  disable_on_destroy = true

    depends_on = [google_project_iam_binding.cloudbuild_sa_permissions]
}

resource "google_project_service" "cloudbuild" {
  service = "cloudbuild.googleapis.com"
  disable_on_destroy = true

    depends_on = [google_project_iam_binding.cloudbuild_sa_permissions]
}

resource "google_project_service" "cloudresourcemanager" {
  service = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = true

    depends_on = [google_project_iam_binding.cloudbuild_sa_permissions]
}

resource "google_project_service" "run" {
  service = "run.googleapis.com"
  disable_on_destroy = true

    depends_on = [google_project_iam_binding.cloudbuild_sa_permissions]
}

resource "google_project_service" "firestore" {
  service = "firestore.googleapis.com"
  disable_on_destroy = true

    depends_on = [google_project_iam_binding.cloudbuild_sa_permissions]
}

resource "google_project_service" "appengine" {
  service = "appengine.googleapis.com"
  disable_on_destroy = true

    depends_on = [google_project_iam_binding.cloudbuild_sa_permissions]
}

resource "google_project_service" "containerregistry" {
  service = "containerregistry.googleapis.com"
  disable_on_destroy = true

   depends_on = [google_project_iam_binding.cloudbuild_sa_permissions]

}

resource "google_project_service" "firebase" {
  service = "firebase.googleapis.com"
  disable_on_destroy = true

    depends_on = [google_project_iam_binding.cloudbuild_sa_permissions]
}

resource "google_project_service" "apigateway" {
  service = "apigateway.googleapis.com"
  disable_on_destroy = true

    depends_on = [google_project_iam_binding.cloudbuild_sa_permissions]
}

resource "google_project_service" "servicecontrol" {
  service = "servicecontrol.googleapis.com"
  disable_on_destroy = true

    depends_on = [google_project_iam_binding.cloudbuild_sa_permissions]
}

resource "google_project_service" "artifactregistry" {
  service = "artifactregistry.googleapis.com"
  disable_on_destroy = true

    depends_on = [google_project_iam_binding.cloudbuild_sa_permissions]
}

resource "google_project_service" "serviceusage" {
  service = "serviceusage.googleapis.com"
  disable_on_destroy = true

    depends_on = [google_project_iam_binding.cloudbuild_sa_permissions]
}

resource "google_project_service" "sourcerepo" {
  service = "sourcerepo.googleapis.com"
  disable_on_destroy = true

    depends_on = [google_project_iam_binding.cloudbuild_sa_permissions]
}

resource "google_project_service" "firebaserules" {
  service = "firebaserules.googleapis.com"
  disable_on_destroy = true

    depends_on = [google_project_iam_binding.cloudbuild_sa_permissions]
}

resource "google_project_service" "domains" {
  service = "domains.googleapis.com"
  disable_on_destroy = true

    depends_on = [google_project_iam_binding.cloudbuild_sa_permissions]
}

resource "google_project_service" "dns" {
  service = "dns.googleapis.com"
  disable_on_destroy = true

  depends_on = [google_project_iam_binding.cloudbuild_sa_permissions]
}
