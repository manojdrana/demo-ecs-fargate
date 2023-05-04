locals {
  aws_region = "us-east-1"
  prefix     = "Terraform-ECS-Fargate-Demo"
  common_tags = {
    Project   = local.prefix
    ManagedBy = "Terraform"
  }
  vpc_cidr = var.vpc_cidr
  task_def_name = "demo-spring-app"
  aws_account_id = "433840921961"
  alb_name = "spring-demoapp-alb"
  target_name = "spring-demoapp-tg"
  service_port = "8080"
  ecs_service_sg_name = "spring-demoapp-sg"
  image_name = "spring-demo-app"
}