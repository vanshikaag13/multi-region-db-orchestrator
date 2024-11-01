resource "aws_sns_topic" "notification_topic" {
  name = "rds-failover-notifications"
}
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.notification_topic.arn
  protocol  = "email"
  endpoint  = "myemail@gmail.com"  
}
resource "aws_sns_topic_subscription" "lambda_subscription" {
  topic_arn = aws_sns_topic.notification_topic.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.failover_lambda.arn  
  depends_on = [aws_lambda_permission.allow_sns]
}