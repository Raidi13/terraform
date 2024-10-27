variable "instances" {
  type        = map
  default     = {
    mysql     = "t3.small"
    backend   = "t3.micro"
    frontend  = "t3.micro"
  }
  description = "description"
}

variable "domain_name" {
  default = "aws-dev-rk.online"
}

variable "zone_id" {
  default = "Z04935171C92BHM9K7BG3"
}
