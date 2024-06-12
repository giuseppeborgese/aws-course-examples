data "aws_ami" "amz2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "name"
    values = ["al2023-ami-2023.4.*"]
  }
}
resource "aws_instance" "v1" {
  ami           = data.aws_ami.amz2.id
  instance_type = "t3.micro"
  subnet_id     = local.subnet_pub_a
  vpc_security_group_ids = [aws_security_group.ec2.id]
  user_data = <<-EOF
#!/bin/bash
yum install httpd -y
echo "<h1>v1</h1>" > /var/www/html/index.html
systemctl start httpd
EOF
  tags = {
    Name = "v1"
  }
}

resource "aws_instance" "v2" {
  ami           = data.aws_ami.amz2.id
  instance_type = "t3.micro"
  subnet_id     = local.subnet_pub_a
  vpc_security_group_ids = [aws_security_group.ec2.id]
  user_data = <<-EOF
#!/bin/bash
yum install httpd -y
echo "<h1>v2</h1>" > /var/www/html/index.html
systemctl start httpd
EOF
  tags = {
    Name = "v2"
  }
}


resource "aws_security_group" "ec2" {
  name        = "${local.prefix}-ec2"
  description = "for ec2"
  vpc_id      = data.aws_subnet.selected.vpc_id
}

#this is enough for the ALB but not for the NLB
resource "aws_vpc_security_group_ingress_rule" "allow_port80ec2" {
  security_group_id = aws_security_group.ec2.id
  cidr_ipv4         = data.aws_vpc.selected.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}
#this work for both the NLB and also ALB since they have the same security group
resource "aws_security_group_rule" "allow_port80ec2_for_nlb" {
  type              = "ingress"
  security_group_id = aws_security_group.ec2.id
  source_security_group_id = aws_security_group.elb.id
  from_port         = 80
  protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ec2" {
  security_group_id = aws_security_group.ec2.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_security_group_rule" "allow_all_ec2" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  cidr_blocks   = ["0.0.0.0/0"]
  from_port         = 0
  security_group_id = aws_security_group.ec2.id
}