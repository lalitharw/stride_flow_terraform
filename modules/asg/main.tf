resource "aws_autoscaling_group" "stride_flow_asg" {
  name                      = "stride-flow-asg"
  max_size                  = 4
  min_size                  = 2
  desired_capacity          = 2
  health_check_grace_period = 600
  health_check_type         = "ELB"
  force_delete              = true
  launch_template {
    id      = var.instance_launch_id
    version = "$Latest"
  }

  instance_refresh {
    strategy = "Rolling"
  }
  vpc_zone_identifier = var.private_subnets
  target_group_arns   = [var.target_group_arn]
  tag {
    key                 = "Name"
    value               = "stride-flow"
    propagate_at_launch = true
  }
}
