resource "aws_lb" "alb-deploy" {
  name               = "${var.project}-ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${var.web_sg}"]
  subnets            = ["${var.public_subnetA}","${var.public_subnetC}"]

  tags = {
    Environment = "dev"
  }
}

resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = "${aws_lb.alb-deploy.arn}"
  port              = "${var.http}"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-deploy.arn}"
  }
}

resource "aws_lb_target_group" "tg-deploy" {
  name     = "${var.project}-tg"
  port     = "${var.http}"
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"
}

resource "aws_lb_target_group_attachment" "alb-attach" {
  target_group_arn = "${aws_lb_target_group.tg-deploy.arn}"
  target_id        = "${aws_instance.nginx_ec2.id}"
  port             = "${var.http}"
}
