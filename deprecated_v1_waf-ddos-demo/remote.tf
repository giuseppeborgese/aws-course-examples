provider "aws" {
  region = "eu-west-1"
}

module "webapp-playground" {
  source = "github.com/giuseppeborgese/effective_devops_with_aws__second_edition//terraform-modules//webapp-playground"
  subnet_public_A = "subnet-01229c21dcdfa42ec"
  subnet_public_B = "subnet-09836b8fbe259f322"
  subnet_private  = "subnet-06066855445364ab9"
  vpc_id          = "vpc-0f1ea025d594a0cdc"
  my_ami          = "ami-0ed961fa828560210"
  pem_key_name    = "classe"
}

module "ddos_protection_WAF" {
  source       = "github.com/giuseppeborgese/effective_devops_with_aws__second_edition//terraform-modules//ddos_protection"
  alb_arn      = "${module.webapp-playground.alb_arn}"
  url = "subdir"
}
