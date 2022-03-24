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

module "secgroup"{
    source = "./modules/sec_group"
    vpc_id = var.vpc_id
}



module "ec2" {
  source = "./modules/ec2"
  vpc_id = var.vpc_id
  subnet_id = var.subnet_id
  sec_grp_id = module.secgroup.sec_group_id
}

//output "secGroup"{
 // value = data.aws_security_group.sg1.name
//}

