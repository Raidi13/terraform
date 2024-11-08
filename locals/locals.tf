locals {
    domain_name = "aws-dev-rk.online"
    zone_id= "Z04935171C92BHM9K7BG3"
    instance_type = var.environment == "prod" ? "t3.medium" : "t3.micro"
    
# count.index will not work in locals we have that limitataion
}
