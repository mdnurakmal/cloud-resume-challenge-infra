resource "google_storage_bucket" "bucket" {
  name = "cloudfunction-deploy-test1"
}

data "archive_file" "http_trigger" {
  type        = "zip"
  output_path = "${var.path}/http_trigger.zip"
  source_dir = "${var.path}/BE"
}

resource "google_storage_bucket_object" "archive" {
  name   = "http_trigger.zip"
  bucket = "${google_storage_bucket.bucket.name}"
  source = "${var.path}/http_trigger.zip"
  depends_on = [data.archive_file.http_trigger]
}

resource "google_cloudfunctions_function" "function" {
  name        = "function-test"
  description = "My function"
  runtime     = "python39"

  region = var.region

  service_account_email =google_service_account.cloud_resume_challenge_worker.email

  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  trigger_http          = true
  entry_point           = "helloGET"

}

# IAM entry for all users to invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function.project
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}