
//data  "aws_security_group" "sgroup1"{
  // filter {
   //  name = "tag:Name"
     //values =  ["allow_tls"]
  // }
//}

resource "aws_instance" "ec2"{
    ami = "ami-0c293f3f676ec4f90"
    instance_type = "t2.micro"
    subnet_id = var.subnet_id
    security_groups = ["${var.sec_grp_id}"]

   

    tags = {
        Name = "server 1"
    }
}


