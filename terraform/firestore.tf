resource "google_firestore_document" "mydoc" {

  collection  = "cloud-resume-challenge-collection"
  document_id = "cloud-resume-challenge"
  fields      = "{\"visitorCount\":{\"mapValue\":{\"fields\":{\"akey\":{\"integerValue\":\"0\"}}}}}"
}

resource "google_firestore_document" "hasInit" {

  collection  = "cloud-resume-challenge-collection"
  document_id = "cloud-resume-challenge"
  fields      = "{\"hasInit\":{\"mapValue\":{\"fields\":{\"akey\":{\"booleanValue\":\"False\"}}}}}"
}




