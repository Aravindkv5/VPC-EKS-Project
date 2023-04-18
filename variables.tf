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