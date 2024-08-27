# Autoscaling Target for Frontend
resource "aws_appautoscaling_target" "bhavik_frontend_scaling_target" {
  max_capacity       = 4
  min_capacity       = 2
  resource_id        = "service/${aws_ecs_cluster.bhavik_ecs_cluster.name}/${aws_ecs_service.bhavik_frontend_service.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

# Autoscaling Policy for Frontend Scale-Out
resource "aws_appautoscaling_policy" "bhavik_frontend_scale_out" {
  name               = "bhavik-frontend-scale-out"
  policy_type        = "StepScaling"
  resource_id        = aws_appautoscaling_target.bhavik_frontend_scaling_target.id
  scalable_dimension = aws_appautoscaling_target.bhavik_frontend_scaling_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.bhavik_frontend_scaling_target.service_namespace

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 300
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = 1
    }
  }
}

# Autoscaling Policy for Frontend Scale-In
resource "aws_appautoscaling_policy" "bhavik_frontend_scale_in" {
  name               = "bhavik-frontend-scale-in"
  policy_type        = "StepScaling"
  resource_id        = aws_appautoscaling_target.bhavik_frontend_scaling_target.id
  scalable_dimension = aws_appautoscaling_target.bhavik_frontend_scaling_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.bhavik_frontend_scaling_target.service_namespace

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 300
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_upper_bound = 0
      scaling_adjustment          = -1
    }
  }
}

# Autoscaling Target for Backend
resource "aws_appautoscaling_target" "bhavik_backend_scaling_target" {
  max_capacity       = 4
  min_capacity       = 2
  resource_id        = "service/${aws_ecs_cluster.bhavik_ecs_cluster.name}/${aws_ecs_service.bhavik_backend_service.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

# Autoscaling Policy for Backend Scale-Out
resource "aws_appautoscaling_policy" "bhavik_backend_scale_out" {
  name               = "bhavik-backend-scale-out"
  policy_type        = "StepScaling"
  resource_id        = aws_appautoscaling_target.bhavik_backend_scaling_target.id
  scalable_dimension = aws_appautoscaling_target.bhavik_backend_scaling_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.bhavik_backend_scaling_target.service_namespace

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 300
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = 1
    }
  }
}

# Autoscaling Policy for Backend Scale-In
resource "aws_appautoscaling_policy" "bhavik_backend_scale_in" {
  name               = "bhavik-backend-scale-in"
  policy_type        = "StepScaling"
  resource_id        = aws_appautoscaling_target.bhavik_backend_scaling_target.id
  scalable_dimension = aws_appautoscaling_target.bhavik_backend_scaling_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.bhavik_backend_scaling_target.service_namespace

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 300
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_upper_bound = 0
      scaling_adjustment          = -1
    }
  }
}
