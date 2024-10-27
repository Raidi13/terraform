 variable "instance_names" {
   type        = list (string)
   default     = ["mysql", "backend", "frontend"]
}
 variable "common_tags" {
   type =map
   default = {
     project = "expense"
     Enviroment = "dev"
     terraform  = "true"
  }
}

 variable "zone_id"{
   default = "Z04935171C92BHM9K7BG3"
}

 variable "domain_name" {
   default = "aws-dev-rk.online"
}

