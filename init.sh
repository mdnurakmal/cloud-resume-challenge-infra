#!/bin/bash
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
terraform state pull
terraform apply -auto-approve -var region=$1