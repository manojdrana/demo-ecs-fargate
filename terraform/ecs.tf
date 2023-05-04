resource "aws_ecs_cluster" "ecs_cluster" {
  name  = "${local.prefix}-vpc"
}

resource "aws_ecs_service" "app" {
  name                               = var.service_name
  cluster                            = aws_ecs_cluster.ecs_cluster.id
  task_definition                    = aws_ecs_task_definition.task_definition.arn
  desired_count                      = 1
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200
  platform_version                   = "LATEST"
  launch_type                        = "FARGATE"
  scheduling_strategy                = "REPLICA"
  force_new_deployment = true
  network_configuration {
    security_groups  = [aws_security_group.ecs_task_sg.id]
    subnets          = module.ecs_vpc.public_subnets
    assign_public_ip = true
  }
  load_balancer {
    target_group_arn = aws_alb_target_group.ecs_alb_target_group.arn
    container_name   = local.task_def_name
    container_port   = local.service_port
  }
}