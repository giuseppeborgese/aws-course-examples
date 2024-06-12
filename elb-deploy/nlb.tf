
resource "aws_lb_listener" "v1" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = "80"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tcp_v1.arn
  }
}
resource "aws_lb_listener" "v2" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = "8080"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tcp_v2.arn
  }
}
resource "aws_security_group" "elb" {
  name        = "${local.prefix}-elb"
  description = "for elb"
  vpc_id      = data.aws_subnet.selected.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "allow_port80elb" {
  security_group_id = aws_security_group.elb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_port8080elb" {
  security_group_id = aws_security_group.elb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}


resource "aws_security_group_rule" "allow_all_elb" {
  security_group_id = aws_security_group.elb.id
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  cidr_blocks   = ["0.0.0.0/0"]
  from_port         = 0
}


resource "aws_lb_target_group" "tcp_v1" {
  name     = "${local.prefix}-tcp-v1"
  port     = 80
  protocol = "TCP"
  vpc_id   = data.aws_subnet.selected.vpc_id
}
resource "aws_lb_target_group_attachment" "tcp_v1" {
  target_group_arn = aws_lb_target_group.tcp_v1.arn
  target_id        = aws_instance.v1.id
  port             = 80
}

resource "aws_lb_target_group" "tcp_v2" {
  name     = "${local.prefix}-tcp-v2"
  port     = 80
  protocol = "TCP"
  vpc_id   = data.aws_subnet.selected.vpc_id
}
resource "aws_lb_target_group_attachment" "tcp_v2" {
  target_group_arn = aws_lb_target_group.tcp_v2.arn
  target_id        = aws_instance.v2.id
  port             = 80
}


resource "aws_lb" "nlb" {
  name               = "${local.prefix}-nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = [local.subnet_pub_a, local.subnet_pub_b, local.subnet_pub_c]
  security_groups    = [aws_security_group.elb.id]
  enable_deletion_protection = false
}