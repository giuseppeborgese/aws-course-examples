provider "aws" {
  region = "eu-west-1"
}
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

locals {
  name = "fixed-response"
}
resource "aws_lb" "test" {
  name               = local.name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.mysg.id]
  subnets            = var.public_subnets
}

resource "aws_security_group" "mysg" {
  vpc_id = var.vpc_id
  name   = local.name

  tags = {
    Name = local.name
  }
}
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/html"
      message_body = "<h1>ciao dal corso</h1>"
      status_code  = "200"
    }
  }
}

resource "aws_security_group_rule" "http" {
  description       = "http access"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.mysg.id
}


resource "aws_security_group_rule" "https" {
  description       = "https access"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.mysg.id
}
