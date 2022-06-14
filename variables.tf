# https://upcloud.com/resources/tutorials/terraform-variables

variable "author" {
  type = string
  default = "Andres Gorostidi"
}

variable "authorMail" {
  type = string
  default = "andres.gorostidi@dacartec.com"
}

variable "owner" {
  type = string
  default = "Juan Carlos Trigo"
}

variable "ownerMail" {
  type = string
  default = "juancarlos.trigo@dacartec.com"
}


variable "environment" {
  type = string
  default = "PROD"
}

variable "terraformUsed" {
  type = string
  default = "True"
}

variable "gitUsed" {
  type = string
  default = "False"
}

variable "gitURL" {
  type = string
  default = "https://github.com/dacartecserviciosinformaticos/ECERT-REST-API.git"
}

variable "customer" {
  type = string
  default = "Internal"
}

variable "proyect" {
  type = string
  default = "ECRA"
}

variable "costcode" {
  type = string
  default = "N/D"
}
