#!/bin/bash

# Check if cloud resource manager is enabled


isServiceEnabled=`gcloud services list --enabled | grep -w -c "cloudresourcemanager.googleapis.com"`

if [[ $isServiceEnabled == 0 ]] 
then
    gcloud services enable cloudresourcemanager.googleapis.com
else
fi


gsutil -q stat gs://$1-cloud-resume-challenge-bucket/terraform/state/default.tfstate

return_value=$?

# Check if bucket exists

if [[ $return_value == 0 ]] 
then
    terraform -chdir=terraform init -backend-config="bucket=${1}-cloud-resume-challenge-bucket" -backend-config="prefix=terraform/state"
    terraform -chdir=terraform state pull
    terraform -chdir=terraform destroy -auto-approve -var project=${2} -var region=${_REGION}


else
    gsutil mb gs://$1-cloud-resume-challenge-bucket
fi