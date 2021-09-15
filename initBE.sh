#!/bin/bash

zip -r function.zip BE

gsutil -q stat gs://cloud-resume-challenge-backend-bucket/function.zip

return_value=$?

if [[ $return_value == 0 ]] 
then
    echo "deleting existing function.zip"
    gsutil rm -r gs://cloud-resume-challenge-backend-bucket
fi

gsutil mb gs://cloud-resume-challenge-backend-bucket/
echo "uploading FE folder"

gsutil cp function.zip  gs://cloud-resume-challenge-frontend-bucket/
