#!/bin/bash


isServiceEnabled= $(gcloud services list --enabled | grep -w -c \"cloudresourcemanager.googleapis.com\")

if [[ $isServiceEnabled == 0 ]] 
then
    echo "cloudresourcemanager not enabled"
    gcloud services enable cloudresourcemanager.googleapis.com --project $2
else
    echo "cloudresourcemanager enabled"
fi


gsutil -q stat gs://cloud-resume-challenge-bucket/terraform/state/default.tfstate

return_value=$?

if [[ $return_value == 0 ]] 
then
    echo "bucket exist"
    terraform state pull
    terraform destroy

else
    gsutil mb gs://cloud-resume-challenge-bucket
fi

cd terraform
terraform init
terraform apply -auto-approve -var region=$1