
# Creation for ap-south-1
module "create_ap-south-1" {
  source          = "./modules/vpc"
  cidr_block      = var.cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  DEFAULT_TAGS    = var.DEFAULT_TAGS
  STAGE           = var.STAGE
    
  providers = {
    aws.vpc_region = aws.Mumbai
  }
}

# Creation for ap-south-2
module "create_ap-south-2" {
  source          = "./modules/vpc"
  cidr_block      = var.cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  DEFAULT_TAGS    = var.DEFAULT_TAGS
  STAGE           = var.STAGE
    
  providers = {
    aws.vpc_region = aws.Hyderabad
  }
}

module "create_s3_bucket" {
  source           = "./modules/s3"
  bucket_name      = var.S3_bucket_name
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  # STAGE            = var.STAGE
  
  
  providers = {
    aws.s3_region = aws.Mumbai
  }
}

#Creation of EC2 in Mumbai 


#Creation of EKS in Mumbai
# module "eks"{
#   source = "./modules/EKS"
#   cluster_name =  "test"
#   providers = {
#     aws.vpc_region = aws.Mumbai
#   }

  #aws_iam_role = "trial"
  #aws_eks_node = "EKS"
  
#}

#Creation of EKS in Hyderabad
# module "eks"{
#   source = "./modules/EKS"
#   cluster_name =  "test"
#   providers = {

#     aws.vpc_region = aws.Hyderabad
#   }

  #aws_iam_role = "trial"
  #aws_eks_node = "EKS"
  
  


#}