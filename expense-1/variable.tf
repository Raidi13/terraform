variable "instance_name" {
  type        = list(string)
  default     = ["mysql", "backend", "frontend"]
  description = "description"
}

variable "domain_name" {
  default = "aws-dev-rk.online"
}

variable "zone_id" {
  default = "Z04935171C92BHM9K7BG3"
}


#let  take the example that you need to create the records
# for mysql u need to use t3.small
# for backend u need to use t3.micro
# for frontend you need to use t3.micro

# you need to get three r53 records using the domain name (aws_dev_rk.online)
# zone id


#condition :
#expression ? "true" : "false"
# (var.instamce_name[count.index] == "mysql"? "t3.small" : "t3.micro" )

#providers
#ec2
#varrbles with 3 instance types


#r53

#