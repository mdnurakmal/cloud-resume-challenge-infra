#!/bin/bash
gcloud config set project $1
gsutil -q stat gs://cloud-resume-challenge-bucket/terraform/state/default.tfstate

return_value=$?

if [[ $return_value == 0 ]] 
then
    echo "bucket exist"
else
    gsutil mb gs://cloud-resume-challenge-bucket
fi