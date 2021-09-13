resource "null_resource" "cloudbuild" {

 provisioner "local-exec" {

    command = "echo ${google_service_account_key.SA_key.private_key}"
  }

   depends_on = [google_service_account_key.SA_key]
}

resource "null_resource" "docker_pull" {

 provisioner "local-exec" {

    command = "echo hello"
  }

   depends_on = [null_resource.cloudbuild]
}




   
