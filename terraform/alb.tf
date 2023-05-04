resource "aws_lb" "ecs_alb" {
  name               = local.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = module.ecs_vpc.public_subnets
  enable_deletion_protection = false
}
resource "aws_alb_target_group" "ecs_alb_target_group" {
  name        = local.target_name
  port        = local.service_port
  protocol    = "HTTP"
  vpc_id      = module.ecs_vpc.vpc_id
  target_type = "ip"
  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    unhealthy_threshold = "2"
  }
}
resource "aws_alb_listener" "http" {
  load_balancer_arn = aws_lb.ecs_alb.id
  port              = local.service_port
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_alb_target_group.ecs_alb_target_group.arn
    type             = "forward"
  }
}