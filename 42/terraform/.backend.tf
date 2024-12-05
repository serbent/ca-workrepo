terraform {
  backend "s3" {
    bucket         = "caaws-tfstate-1eltbaemi6pv7wm"
    key            = "terraform/state"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "terraform-state-locks"
  }
}
