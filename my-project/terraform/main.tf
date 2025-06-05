provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_project_bucket" {
  bucket = "my-project-bucket-${random_string.bucket_suffix.result}"
  acl    = "private"

  # SECURITY ISSUE: Unrestricted public access
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
}

# SECURITY ISSUE: Plaintext password in configuration
resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "password123"  # Hard-coded password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
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
      # SECURITY ISSUE: Hard-coded API key
      API_KEY = "1234567890abcdef"
    }
  }
}

resource "aws_iam_role" "lambda_execution_role" {
  name = "lambda_execution_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

output "bucket_name" {
  value = aws_s3_bucket.my_project_bucket.bucket
}

output "lambda_function_name" {
  value = aws_lambda_function.my_project_lambda.function_name
}

output "db_instance_endpoint" {
  value = aws_db_instance.default.endpoint
}

# Duplicate code - deliberate code smell
output "bucket_name_duplicate" {
  value = aws_s3_bucket.my_project_bucket.bucket
}
output "lambda_function_name_duplicate" {
  value = aws_lambda_function.my_project_lambda.function_name
}
output "db_instance_endpoint_duplicate" {
  value = aws_db_instance.default.endpoint
}