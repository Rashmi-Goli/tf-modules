module "sec_group"{
    source = "../sec_group"
    vpc_id = var.vpc_id
}

#data  "aws_security_group" "sg1"{
 #  filter {
   #  name = "tag:Name"
  #   values =  ["allow_tls"]
  # }
#}

resource "aws_instance" "ec2"{
    ami = "ami-0c293f3f676ec4f90"
    instance_type = "t2.micro"
    subnet_id = var.subnet_id
    security_groups = [module.sec_group.sec_group_name]

   depends_on = [
    module.sec_group.sec_group_name
   ]

    tags = {
        Name = "server 1"
    }
}


