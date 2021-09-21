#enable all necessary apis

resource "google_project_service" "iam" {
  service = "iam.googleapis.com"
}

resource "google_project_service" "cloudbuild" {
  service = "cloudbuild.googleapis.com"

}

resource "google_project_service" "cloudresourcemanager" {
  service = "cloudresourcemanager.googleapis.com"
 
}

resource "google_project_service" "run" {
  service = "run.googleapis.com"
 
}

resource "google_project_service" "firestore" {
  service = "firestore.googleapis.com"

}

resource "google_project_service" "appengine" {
  service = "appengine.googleapis.com"
}

resource "google_project_service" "containerregistry" {
  service = "containerregistry.googleapis.com"

}

resource "google_project_service" "firebase" {
  service = "firebase.googleapis.com"

}

resource "google_project_service" "apigateway" {
  service = "apigateway.googleapis.com"

}

resource "google_project_service" "servicecontrol" {
  service = "servicecontrol.googleapis.com"

}

resource "google_project_service" "artifactregistry" {
  service = "artifactregistry.googleapis.com"

}

resource "google_project_service" "serviceusage" {
  service = "serviceusage.googleapis.com"
  
}

resource "google_project_service" "sourcerepo" {
  service = "sourcerepo.googleapis.com"

}

resource "google_project_service" "firebaserules" {
  service = "firebaserules.googleapis.com"

}

resource "google_project_service" "domains" {
  service = "domains.googleapis.com"

}

resource "google_project_service" "dns" {
  service = "dns.googleapis.com"

}
