# terraform {
#   required_providers {
#     aws = {
#       source                = "hashicorp/aws"
#       region = "ap-south-1"
#     }
#   }
# }
# resource "aws_s3_bucket" "bucket" {
#     bucket = "terraform-state-backend"
#     versioning {
#         enabled = true
#     }

#     tags = {
#         Name = "S3 Remote Terraform State Store"
#     }
# }

# resource "aws_dynamodb_table" "terraform-lock" {
#     name           = "terraform_state"
#     read_capacity  = 5
#     write_capacity = 5
#     hash_key       = "LockID"
#     attribute {
#         name = "LockID"
#         type = "S"
#     }
#     tags = {
#         "Name" = "DynamoDB Terraform State Lock Table"
#     }
# }

# terraform {
#   backend "s3" {
#     bucket         = "aterraform-state-backend"
#     key            = "terraform.tfstate"
#     region         = "ap-south-1"
#     dynamodb_table = "terraform_state"
#   }
# }