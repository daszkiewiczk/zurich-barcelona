# NUWE-Zurich-Cloud-Hackathon
This repository contains my entry for the on-site phase of the NUWE x Zurich Cloud Challenge.
# Solution description
Terraform has been utilized to define a VPC, a subnet located in the VPC, two EC2 instances in the subnet together with their security groups and a S3 bucket.

Terraform's 'file' provisioner has been used to inject python application code into the EC2 instances using ssh the respective ssh keys.

EC2 instances' user_data has been set to run the flask server.

Inside the app repo Jenkins pipeline has been defined with Jenkinsfile - this pipeline runs `terraform apply` thorugh 'tfswitch'.

# How to run and test the solution
## Prerequisites
Run auto-install.sh to install all the necessary dependencies.
```
./auto-install.sh
```
# Running the containers
Run docker-compose up from the root directory of the project.
```
docker-compose up --build -d
```
Install the Gogs server:
- go to `http://localhost:3000`
- change database type to SQLite3
- keep other settings as default
- create a `zurich` user with password `zurich`
- go to Your Settings -> Applications -> Generate New Token -> copy the token
- run `export GOGS_TOKEN=<YOUR_TOKEN>`
- run `./add_gogs_repo.py` to add gogs repository and push app code and .tf files

Install Jenkins:
- go to `http://localhost:8000`
- install with defaults values
- create a git pipeline, for url enter the gogs repo url (add_gogs_repo.py script outputs this url)
- In Jenkins, go to the project configuration of the project for which you want to run an automated build. In the 'Build Triggers' section, select 'Build when a change is pushed to GitHub