provider "aws" {
  region = "eu-west-1"
}

module "ecs-fargate-poc" {
  source  = "giuseppeborgese/ecs-fargate-poc/aws"
  app_port = 80
  private_subnets = ["subnet-078171ba6d73111d9","subnet-085f4cc0b227a5d41"]
  public_subnets =  ["subnet-eca9a0a5", "subnet-2104447a"]
  prefix = "terraform-poc"
  image_uri_with_tag = "public.ecr.aws/nginx/nginx:latest"
}

