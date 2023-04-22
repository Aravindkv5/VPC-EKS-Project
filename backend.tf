terraform {
  backend "s3" {
    bucket = "new-s3-bucket-terraform"
    key = "terraform"
    region = "ap-south-1"
    dynamodb_table = "terraform-lock"
  }
}
