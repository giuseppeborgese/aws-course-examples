
resource "aws_lb" "alb" {
  name               = "${local.prefix}-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [local.subnet_pub_a, local.subnet_pub_b, local.subnet_pub_c]
  security_groups    = [aws_security_group.elb.id]
  enable_deletion_protection = false
}
resource "aws_lb_listener" "http_v1" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http_v1.arn
  }
}

resource "aws_lb_listener" "http_v2" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "8080"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http_v2.arn
  }
}

resource "aws_lb_target_group" "http_v1" {
  name     = "${local.prefix}-http-v1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_subnet.selected.vpc_id
}
resource "aws_lb_target_group_attachment" "http_v1" {
  target_group_arn = aws_lb_target_group.http_v1.arn
  target_id        = aws_instance.v1.id
  port             = 80
}

resource "aws_lb_target_group" "http_v2" {
  name     = "${local.prefix}-http-v2"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_subnet.selected.vpc_id
}
resource "aws_lb_target_group_attachment" "http_v2" {
  target_group_arn = aws_lb_target_group.http_v2.arn
  target_id        = aws_instance.v2.id
  port             = 80
}