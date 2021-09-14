#!/bin/bash
gsutil -q stat gs://cloud-resume-challenge-bucket/terraform/state/default.tfstate

return_value=$?

if [[ $return_value == 0 ]] 
then
    echo "bucket exist"
else
    gsutil mb gs://cloud-resume-challenge-bucket
fi

cd terraform && terraform init
cd terraform && terraform state pull
cd terraform && terraform apply -auto-approve -var region=$1