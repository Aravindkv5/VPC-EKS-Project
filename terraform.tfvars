cidr_block = {
  "ap-south-1" : "10.11.0.0/16"
  "ap-south-2" : "10.11.0.0/16"

}
public_subnets = {
  "ap-south-1" : ["10.11.10.0/24", "10.11.20.0/24"]
  "ap-south-2" : ["10.11.10.0/24", "10.11.20.0/24"]
  
}

private_subnets = {
  "ap-south-1" : ["10.11.110.0/24", "10.11.120.0/24"]
  "ap-south-2" : ["10.11.110.0/24", "10.11.120.0/24"]

}

DEFAULT_TAGS = {
  Created-Using = "Terraform"
  Env   = "Testing-terraform"
}

S3-bucket-name = "terraform-state-backend"