locals{
    ingress_rules = [
        {
            port = 80
            description = "HTTP enabled"
        },
        {
            port = 443
            description = "HTTPS enabled"
        }
    ]
}

resource "aws_security_group" "sg1"{
  name        = "SG1"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id
  dynamic ingress{
        for_each = local.ingress_rules
        content{
                
                    description = ingress.value.description
                    from_port   = ingress.value.port
                    to_port     = ingress.value.port
                    protocol    = "tcp"
                    cidr_blocks = ["0.0.0.0/0"]
                
            }
    }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }

}
