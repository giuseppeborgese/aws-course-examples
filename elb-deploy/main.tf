locals { 
  prefix = "demo-elb-routing"
  region = "eu-central-1"
  #these subnet have the public ip assign automatically to true 
  subnet_pub_a = "subnet-c89c1ca3"
  subnet_pub_b = "subnet-7d804500"
  subnet_pub_c = "subnet-1789225a"
}

data "aws_subnet" "selected" {
  id = local.subnet_pub_a
}
#extract a vpc data.aws_subnet.selected.vpc_id
data "aws_vpc" "selected" {
  id = data.aws_subnet.selected.vpc_id
}
#extract data.aws_vpc.selected.cidr_block

provider "aws" {
  region = local.region
}

#security group ec2
#security group alb
#ec2 v1
#ec2 v2
#target group ec2 v1 TCP
#target group ec2 v2 TCP
#target group ec2 v1 HTTP
#target group ec2 v2 HTTP
#nlb  
#alb 
#target group alb 

