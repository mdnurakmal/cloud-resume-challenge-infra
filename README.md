# cloud-resume-challenge-infra

# Usage
Usage after creating new GCP project and enable billing.

- Enable Cloud Build API, Cloud Source Repositories API
- Connect all 3 github repository to CSR
- - Create Cloud Build Trigger for each repository
- Set Cloud Build service account to Owner (Only for learning , Fine-grained access control for better security)
- Manually run all triggers on all repo or push to every repository


The following task/resources requires user intervention to create them.
- Reserve Static IP Address , Create Zone with custom domain in Cloud DNS
- Create Google managed SSL Certificate
- Create Load Balancer and Configure (Backend service, Backend Bucket)

# Reference
- https://cloud.google.com/iam/docs/service-agents

Why there is CORS error 
- https://cloud.google.com/functions/docs/writing/http#functions_http_cors_auth-python
- https://stackoverflow.com/questions/56919391/is-there-a-way-to-set-imagepullpolicy-for-cloud-run-service
- https://cloud.google.com/build/docs/configuring-builds/substitute-variable-values
- https://github.com/GoogleCloudPlatform/cloud-builders
- https://medium.com/google-cloud/terraform-plan-in-pull-requests-with-gcp-cloud-build-603790a2b734
- https://davidstanke.medium.com/mastering-google-cloud-build-config-syntax-8c3024607daf


- Unable to use variable in terraform backend block ?
- https://github.com/hashicorp/terraform/issues/13022

- How to secure api ? using auth ?
- Why static page is still using cached data even when CDN on load balancing is disabled
- required permissions (cloud storage for firebase admin , firebase admin , firestore agent, storage admin)
