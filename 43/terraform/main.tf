provider "aws" {
  region = "us-east-1"
}

# IAM Policy for Read-Only Access to EC2 and S3
resource "aws_iam_policy" "read_only_policy" {
  name        = "ReadOnlyPolicy"
  description = "Provides read-only access to EC2 and S3 resources"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "ec2:Describe*",
        #   "ec2:Create*",
          "s3:Get*",
          "s3:List*"
        ],
        Resource = "*"
      }
    ]
  })
}

# IAM Role
resource "aws_iam_role" "readonly_role" {
  name               = "ReadOnlyRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach Policy to Role
resource "aws_iam_role_policy_attachment" "readonly_attach" {
  role       = aws_iam_role.readonly_role.name
  policy_arn = aws_iam_policy.read_only_policy.arn
}

# Create IAM Users
resource "aws_iam_user" "users" {
  count = 3
  name  = "readonly-user-${count.index + 1}"
}

# Attach Role to Users
resource "aws_iam_user_policy_attachment" "attach_users_to_policy" {
  count      = length(aws_iam_user.users)
  user       = aws_iam_user.users[count.index].name
  policy_arn = aws_iam_policy.read_only_policy.arn
}

# Output
output "user_names" {
  value = aws_iam_user.users[*].name
}
