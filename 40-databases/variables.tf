variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "sg_names" {
  default = [
    #databases
    "mongodb", "redis", "mysql", "rabbitmq",
    #backend
    "catalogue", "user", "cart", "shipping", "payment",
    #frontend
    "frontend",
    #bastion
    "bastion",
    #load balencer frontend
    "frontend_alb",
    #backend alb
    "backend_alb"

  ]
}

variable "zone_id"{
  default = Z024817821F8L6OR4TDA8
}

variable "domain_name" {
  default = ahay.space
}