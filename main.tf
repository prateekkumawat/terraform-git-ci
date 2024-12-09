terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.80.0"
    }
  }
  backend "s3" {
    bucket = "terraform-state-hsit"
    key    = "hsit-state"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = var.aws_region
}


module "dev" {
  source = "./modules/dev"

  vpc_cidr = "10.0.0.0/16"
  subnet_cidr = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
  subnet_az = ["ap-south-1a", "ap-south-1b"]
}
