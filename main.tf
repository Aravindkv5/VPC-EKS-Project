
# Creation for ap-south-1
module "create_ap-south-1" {
  source          = "modules/vpc"
  cidr_block      = var.cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  DEFAULT_TAGS    = var.DEFAULT_TAGS
    
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
    
  providers = {
    aws.vpc_region = aws.Hyderabad
  }
}