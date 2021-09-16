resource "google_firestore_document" "mydoc" {

  collection  = "cloud-resume-challenge-collection"
  document_id = "cloud-resume-challenge"
  fields      = "{\"visitorCount\":{\"mapValue\":{\"fields\":{\"akey\":{\"numberValue\":\"0\"}}}}}"
}

