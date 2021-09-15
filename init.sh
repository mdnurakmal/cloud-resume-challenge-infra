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

cd terraform
terraform init

echo "heree0"
echo $2

if [[ $return_value == 0 ]] 
then
    echo "bucket exist"
    terraform state pull
    terraform destroy

else
    gsutil mb gs://cloud-resume-challenge-bucket
fi

echo $PWD


terraform apply -auto-approve -var region=$1 -var path=$2

cd ..

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