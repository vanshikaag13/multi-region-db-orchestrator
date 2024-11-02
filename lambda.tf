resource "aws_lambda_permission" "allow_sns" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.failover_lambda.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.notification_topic.arn
}