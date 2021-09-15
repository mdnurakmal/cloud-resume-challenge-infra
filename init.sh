#!/bin/bash


isServiceEnabled=`gcloud services list --enabled | grep -w -c "cloudresourcemanager.googleapis.com"`

if [[ $isServiceEnabled == 0 ]] 
then
    echo "cloudresourcemanager not enabled"
    gcloud services enable cloudresourcemanager.googleapis.com
else
    echo "cloudresourcemanager enabled"
fi


gsutil -q stat gs://cloud-resume-challenge-bucket/terraform/state/default.tfstate

return_value=$?

terraform -chdir=terraform init

if [[ $return_value == 0 ]] 
then
    echo "bucket exist"
    terraform -chdir=terraform state pull
    terraform -chdir=terraform destroy

else
    gsutil mb gs://cloud-resume-challenge-bucket
fi

#app engine application has been created previously
terraform -chdir=terraform import google_app_engine_application.app $2
terraform -chdir=terraform apply -auto-approve -var region=$1
gsutil -q stat gs://cloud-resume-challenge-frontend-bucket/index.html

return_value=$?

if [[ $return_value == 0 ]] 
then
    echo "deleting existing FE folder"
    gsutil rm -r gs://cloud-resume-challenge-frontend-bucket
fi

gsutil mb gs://cloud-resume-challenge-frontend-bucket/
echo "uploading FE folder"

gsutil cp -r FE/* gs://cloud-resume-challenge-frontend-bucket/


gsutil iam ch allUsers:objectViewer gs://cloud-resume-challenge-frontend-bucket
gsutil web set -m index.html -e 404.html gs://cloud-resume-challenge-frontend-bucket