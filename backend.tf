terraform {
  backend "s3" {
    bucket         = "bahireal" # REPLACE THIS WITH YOUR ACTUAL BUCKET NAME
    key            = "eks-platform/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile   = false  # Optional, but recommended
  }
}
