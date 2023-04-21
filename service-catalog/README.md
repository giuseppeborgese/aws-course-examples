# step to step
this demo is taken from the post 
https://aws.amazon.com/blogs/aws/new-self-service-provisioning-of-terraform-open-source-configurations-with-aws-service-catalog/

here the steps necessary to:
* install aws sam, go 
* do the git clone
* from the git repo run the command
```
bin/bash/deploy-tre.sh -r us-east-1
```
this will create in the north virginia region a vcp with many other resources and an ec2 machine where terraform runs. It requires 6  minutes
* show the role SCLaunch-test-terraform I have created following the page https://docs.aws.amazon.com/servicecatalog/latest/adminguide/getstarted-launchrole-Terraform.html
* follow the instruction on the blog post, what is missing is inserting on the catalog the option to be visible to others users
* also the example provided has an error in the ami-id follow the correct one in this repo.
