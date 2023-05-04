resource "aws_ecs_task_definition" "task_definition" {
  family                   = local.task_def_name
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  memory                   = 4096
  cpu                      = 2048
  container_definitions = jsonencode([
    {
      name      = local.task_def_name
      image     = "${local.aws_account_id}.dkr.ecr.${local.aws_region}.amazonaws.com/${local.task_def_name}:latest"
      cpu       = 512
      memory    = 1024
      essential = true
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
        }
      ]
      environment = [
        {
          "name" : "SPRING_PROFILES_ACTIVE",
          "value" : var.spring_profile
        }
      ]
    }
  ])
  tags = merge(
    local.common_tags,
    {
      Name = local.task_def_name
    }
  )
}