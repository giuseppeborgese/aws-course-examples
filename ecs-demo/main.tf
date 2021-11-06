provider "aws" {
  region = "eu-west-1"
}
/*
module "ecs-fargate-poc" {
  source  = "giuseppeborgese/ecs-fargate-poc/aws"
  app_port = 80
  private_subnets = ["subnet-06066855445364ab9","subnet-0cd0afd348e2f70e0"]
  public_subnets =  ["subnet-01229c21dcdfa42ec", "subnet-09836b8fbe259f322"]
  prefix = "terraform-poc"
  image_uri_with_tag = "public.ecr.aws/nginx/nginx:latest"
}
*/
