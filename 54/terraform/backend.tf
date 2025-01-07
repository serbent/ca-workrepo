terraform {
  backend "s3" {
    bucket         = "cadevopsua3terraformstate-asdeww"      # S3 bucket to store the state
    key            = "ca/54/terraform.tfstate"   # Path within the bucket for the state file
    region         = "eu-central-1"                     # AWS region where the bucket is located
    encrypt        = true                            # Enable server-side encryption
    # dynamodb_table = "terraform-lock-table"          # DynamoDB table for state locking
  }
}
