data "external" "whatismyip" {
  program = ["/bin/bash" , "./whatismyip.sh"]
}

resource "aws_security_group" "ECERT_sg" {
  name   = "ECERT-SSH-Web Everyone"
  vpc_id = "vpc-07c7ff1d8436a8ab8"
  //vpc_id= "vpc-01fa1769"

  // HTTP Port
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // HTTPS Port
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // SSH port
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [format("%s/%s",data.external.whatismyip.result["internet_ip"],32)]
  }
  
   // LDAP Port
  ingress {
    from_port   = 389
    to_port     = 389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

     // xrdp Port
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = [format("%s/%s",data.external.whatismyip.result["internet_ip"],32)]
  }

    ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["10.100.1.0/24","83.61.8.134/32"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ECERT CLOUD"
    Author = "Andres Gorostidi"
  }
}
