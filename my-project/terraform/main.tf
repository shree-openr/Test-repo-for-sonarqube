provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_project_bucket" {
  bucket = "my-project-bucket-${random_string.bucket_suffix.result}"
  acl    = "private"
}

resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
}

resource "aws_lambda_function" "my_project_lambda" {
  function_name = "myProjectFunction"
  s3_bucket     = aws_s3_bucket.my_project_bucket.bucket
  s3_key        = "lambda_function.zip"
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  role          = aws_iam_role.lambda_execution_role.arn
  environment {
    variables = {
      NODE_ENV = "production"
  }
  }
}

output "bucket_name" {
  value = aws_s3_bucket.my_project_bucket.bucket
}

output "lambda_function_name" {
  value = aws_lambda_function.my_project_lambda.function_name
}