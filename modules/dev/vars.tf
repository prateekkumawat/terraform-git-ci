# variable define for aws vpc service used by devvpc
variable "vpc_cidr" {}
variable "subnet_cidr" {
    type = list 
}
variable "subnet_az" {
    type = list 
}

# variables file for security group 

