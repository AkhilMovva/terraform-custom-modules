variable "domain_name" {
  type = string
  description = "domain name"
#   default = "akhilmovva.live"
}

variable "environment" {
    type = string
    description = "environment name"
    # default = "dev"
}

variable "flask_ip" {
    type = string
    description = "flask host public ip address"   
}

variable "mysql_ip" {
    type = string
    description = "mysql server public ip address"   
}