provider "aws" {
  region = var.region
}
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "aws_lb" "test" {
  name               = var.name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.mysg.id]
  subnets            = var.subnets_id
}
data "aws_subnet" "selected" {
  id = var.subnets_id[0]
}


resource "aws_security_group" "mysg" {
  vpc_id = data.aws_subnet.selected.vpc_id
  name   = var.name

  tags = {
    Name = var.name
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
      message_body = "<h1>Hello from ${var.region}</h1>"
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
