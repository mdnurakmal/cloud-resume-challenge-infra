#!/bin/bash
sudo curl -fsSLO https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh
sudo chmod +x ./install.sh
sudo ./install.sh

tfswitch -u -b /bin
sudo ln -sf $HOME/bin/terraform /usr/local/bin/terraform


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