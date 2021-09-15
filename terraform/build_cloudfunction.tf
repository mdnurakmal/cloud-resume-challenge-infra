resource "google_storage_bucket" "bucket" {
  name = "cloudfunction-deploy-test1"
}

data "archive_file" "http_trigger" {
  type        = "zip"
  output_path = "http_trigger.zip"
  source_dir = "BE"
}

resource "google_storage_bucket_object" "archive" {
  name   = "http_trigger.zip"
  bucket = "${google_storage_bucket.bucket.name}"
  source = "${var.pwd}/http_trigger.zip"
  depends_on = [data.archive_file.http_trigger]
}
