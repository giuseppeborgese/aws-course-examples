locals { 
  region = "eu-west-1" #us-east-1"
}
provider "aws" {
  region = local.region
}

module "ecs-fargate-poc" {
  source  = "giuseppeborgese/ecs-fargate-poc/aws"
  app_port = 80
  private_subnets = module.vpc.private_subnets
  public_subnets =  module.vpc.public_subnets
  prefix = "terraform-poc"
  #put the tag at the end :latest or :v1
  image_uri_with_tag = "public.ecr.aws/nginx/nginx:latest"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "ECS-DEMO-TEST"
  cidr = "10.0.0.0/16"

  azs             = ["${local.region}a", "${local.region}b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}