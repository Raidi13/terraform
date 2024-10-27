variable "instance_name" {
  type        = list(string)
  default     = ["mysql", "backend", "frontend"]
  description = "description"
}

# variable "domain_name" {
#   default = "aws-dev-rk.online"
# }

# variable "zone_id" {
#   default = "Z04935171C92BHM9K7BG3"
# }