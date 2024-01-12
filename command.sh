#/bin/bash

#Init state and download packages
terraform init

#Format Ts files
terraform format

#Review to apply
terraform plan

#Execute Plan and create resources
terraform apply --auto-approve

#Destroy all resources
terraform destroy

#Create Workspaces
terraform workspace new nameofworkspace

#List all workspaces
terraform workspace list

#Switch to workspace
terraform workspace select nameofworkspaces