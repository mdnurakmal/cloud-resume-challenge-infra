#!/bin/bash


isServiceEnabled=`gcloud services list --enabled | grep -w -c "cloudresourcemanager.googleapis.com"`

if [[ $isServiceEnabled == 0 ]] 
then
    echo "cloudresourcemanager not enabled"
    gcloud services enable cloudresourcemanager.googleapis.com
else
    echo "cloudresourcemanager enabled"
fi


gsutil -q stat gs://$1-cloud-resume-challenge-bucket/terraform/state/default.tfstate

return_value=$?

terraform -chdir=terraform init

if [[ $return_value == 0 ]] 
then
    echo "bucket exist"
    terraform -chdir=terraform state pull
    terraform -chdir=terraform destroy

else
    echo "bucket doesnt exist"
    gsutil mb gs://$1-cloud-resume-challenge-bucket
fi