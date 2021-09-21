resource "google_firestore_document" "mydoc" {

  collection  = "cloud-resume-challenge-collection"
  document_id = "cloud-resume-challenge"
  fields      = "{\"visitorCount\":{\"mapValue\":{\"fields\":{\"akey\":{\"integerValue\":\"0\"}}}},\"hasInit\":{\"booleanValue\":\"False\"}}"

  depends_on = [google_app_engine_application.app]
}

# Create app engine application if it doesnt exists
resource "google_app_engine_application" "app" {
  project = local.project
  database_type = "CLOUD_FIRESTORE"
  location_id = var.region

}
