# resource block for eip #
resource "aws_eip" "myeip" {
  vpc      = true

      tags = {
      Name         = "IP ECERT-REST-API"
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

# resource block for ec2 and eip association #
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ECERT_instance.id
  allocation_id = aws_eip.myeip.id
}