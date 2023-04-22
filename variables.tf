variable "cidr_block" {
  type = map(string)
  description = "CIDR Block for vpc"
}

variable "public_subnets" {
  type = map(list(string))
  description = "List of public subnet cidrs"
}

variable "private_subnets" {
  type = map(list(string))
  description = "List of private subnet cidrs"
}

variable "DEFAULT_TAGS" {
  type = map(any)
  description = "Default Tags for all resources"
}

variable "STAGE" {
  type = string
  default = "Env"
  description = "Stage for deployment"
}

variable "S3_bucket_name" {
  type = string  
  description = "S3 Bucket name"
}

variable "datacenter_codes" {
  type = map(string)
  description = "Data center code values"
}