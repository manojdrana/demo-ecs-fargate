terraform {
  backend "s3" {
    bucket = "csvpocbucket"
    key    = "vpc.tfstate"
    region = "us-east-1"
    encrypt = "true"
  }
}
