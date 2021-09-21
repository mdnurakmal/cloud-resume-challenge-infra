# cloud-resume-challenge-infra

# Usage

1. Create a project in Google Cloud Console
2. Click 'Run on Google' button


[![Run on Google
Cloud](https://deploy.cloud.run/button.svg)](https://deploy.cloud.run/?git_repo=https://github.com/mdnurakmal/cloud-resume-challenge-infra.git)


# Learning notes
- Cant use cloud run button because no building of image is needed 


# Reference
- https://cloud.google.com/iam/docs/service-agents

Why there is CORS error 
- https://cloud.google.com/functions/docs/writing/http#functions_http_cors_auth-python
- https://stackoverflow.com/questions/56919391/is-there-a-way-to-set-imagepullpolicy-for-cloud-run-service
- https://cloud.google.com/build/docs/configuring-builds/substitute-variable-values
- https://github.com/GoogleCloudPlatform/cloud-builders
- https://medium.com/google-cloud/terraform-plan-in-pull-requests-with-gcp-cloud-build-603790a2b734
- https://davidstanke.medium.com/mastering-google-cloud-build-config-syntax-8c3024607daf

Unable to use variable in backend block ?
- https://github.com/hashicorp/terraform/issues/13022

- How to secure api ? using auth ?
- Why static page is still using cached data even when CDN on load balancing is disabled
- required permissions (cloud storage for firebase admin , firebase admin , firestore agent, storage admin)