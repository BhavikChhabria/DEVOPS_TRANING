# ECS Cluster
resource "aws_ecs_cluster" "bhavik_ecs_cluster" {
  name = "bhavik-ecs-cluster"
}

# ECS Task Definition for Frontend
resource "aws_ecs_task_definition" "bhavik_frontend_task" {
  family                   = "bhavik-frontend-task"
  network_mode             = "bridge"
  requires_compatibilities = ["EC2"]
  container_definitions    = jsonencode([
    {
      name      = "bhavik-frontend-container"
      image     = "bhavik-frontend-image"
      cpu       = 256
      memory    = 512
      essential = true
    }
  ])
}

# ECS Task Definition for Backend
resource "aws_ecs_task_definition" "bhavik_backend_task" {
  family                   = "bhavik-backend-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([{
    name      = "backend"
    image     = "python:3.9-slim"
    cpu       = 256
    memory    = 512
    essential = true
    portMappings = [
      {
        containerPort = 5000
        hostPort      = 5000
      }
    ]
  }])
}


# ECS Service for Frontend
resource "aws_ecs_service" "bhavik_frontend_service" {
  name            = "bhavik-frontend-service"
  cluster         = aws_ecs_cluster.bhavik_ecs_cluster.id
  task_definition = aws_ecs_task_definition.bhavik_frontend_task.arn
  desired_count   = 2
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_b.id]
    security_groups  = [aws_security_group.frontend_sg.id]
    assign_public_ip = true
  }
}

# ECS Service for Backend
resource "aws_ecs_service" "bhavik_backend_service" {
  name            = "bhavik-backend-service"
  cluster         = aws_ecs_cluster.bhavik_ecs_cluster.id
  task_definition = aws_ecs_task_definition.bhavik_backend_task.arn
  desired_count   = 2
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = [aws_subnet.private_subnet_a.id, aws_subnet.private_subnet_b.id]
    security_groups  = [aws_security_group.backend_sg.id]
    assign_public_ip = false
  }
}
