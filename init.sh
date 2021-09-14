#!/bin/bash

gcloud services list --enabled | grep -w "cloudresourcemanager.googleapis.com"

if [[ $? == 0 ]] 
then
    echo "cloudresourcemanager not enabled"
    gcloud services enable cloudresourcemanager.googleapis.com
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