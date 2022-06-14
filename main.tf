
provider "aws" {
  region                  = "eu-central-1"
 # shared_credentials_file = "/home/andres/.aws/credentials"
  profile                 = "dacartec"
}


data "cloudinit_config" "ECERT_server_config" {
  gzip          = true
  base64_encode = true
  part {
    content_type = "text/cloud-config"
    content      = file("${path.module}/initial-config.yml")
  }
}



// Servidor 1 : ECERT-REST-API 

resource "aws_instance" "ECERT_instance" {
  ami           = "ami-015c25ad8763b2f11" // Ubuntu 22.04 LTS  (Must Subscribe before)
  instance_type = "t2.medium"
  monitoring    = true
  key_name      = "dct_frankfourt"

  subnet_id                   = "subnet-01e16ea58475f0a77"
  //iam_instance_profile        = "dev-ssm-role"
  vpc_security_group_ids      = [aws_security_group.ECERT_sg.id]
  associate_public_ip_address = true

  user_data = data.cloudinit_config.ECERT_server_config.rendered

  // MAIN Root-Boot Volume
  root_block_device {
    delete_on_termination = true
    volume_type           = "gp3"
    volume_size           = 40
  
    tags = {
      Name         = "ROOT"
      AttachedTo   = "ECERT-REST-API"
      Author       = var.author
      Author-Email = var.authorMail
      Owner        = var.owner
      Owner-Email  = var.ownerMail
      Environment  = var.environment
      Terraform    = var.terraformUsed
      Git          = var.gitUsed
      GitURL       = var.gitURL
      Customer     = var.customer
      CostCode     = var.costcode
      ProyectCode  = var.proyect
    }
  }

  tags = {
    Name         = "ECERT-REST-API"
    OS-Release   = "Ubuntu 22.04 LTS"
    OS-Type      = "Linux"
    Backup       = "False"
    Author       = var.author
    Author-Email = var.authorMail
    Owner        = var.owner
    Owner-Email  = var.ownerMail
    Environment  = var.environment
    Terraform    = var.terraformUsed
    Git          = var.gitUsed
    GitURL       = var.gitURL
    Customer     = var.customer
    CostCode     = var.costcode
    ProyectCode  = var.proyect

  }
}
