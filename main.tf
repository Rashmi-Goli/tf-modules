terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3"{
      bucket = "rg-bkt1"
      key = "state/key"
      region = "us-east-1"
  }
}



module "ec2" {
  source = "./modules/ec2"
  vpc_id = var.vpc_id
  subnet_id = var.subnet_id

}

