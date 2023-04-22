terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.vpc_region]
    }
  }
}

data "aws_region" "current" {
  provider = aws.vpc_region
}
