resource "aws_sns_topic" "cloudwatch_alarms" {
  count = var.cloudwatch_alarms ? 1 : 0

  tags = var.tags
  name = "cloudwatch-alarms"
}

resource "aws_cloudwatch_metric_alarm" "ec2_cpu_utilization" {
  count = var.cloudwatch_alarms ? var.web_server_count : 0

  tags                = var.tags
  alarm_name          = "ec2-cpu-utilization"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "High CPU Utilization (EC2)"
  alarm_actions       = aws_sns_topic.cloudwatch_alarms.*.arn
  ok_actions          = aws_sns_topic.cloudwatch_alarms.*.arn
  dimensions = {
    InstanceId = aws_instance.web_servers[count.index].id
  }
}
