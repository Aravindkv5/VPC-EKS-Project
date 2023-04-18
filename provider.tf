provider "aws" {
    region = "ap-south-1"
    alias = "Mumbai"
}

provider "aws" {
    region = "ap-south-2"
    alias = "Hyderabad"
}

provider "aws"{
    access_key=var.access_key
    secret_key=var.secret_key
}
