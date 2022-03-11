data  "aws_security_group" "sg1"{
   filter {
     name = "tag:Name"
     values =  "sg1"
   }
}

resource "aws_instance" "ec2"{
    ami = "ami-0c293f3f676ec4f90"
    instance_type = "t2.micro"
    subnet_id = var.subnet_id
    security_groups = [data.aws_security_group.sg1.name]

   depends_on = [
     data.aws_security_group.sg1
   ]

    tags = {
        Name = "server 1"
    }
}


