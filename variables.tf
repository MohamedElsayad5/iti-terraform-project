variable "region" {
    type = string
    default = "us-east-1"
}

variable "vpc_cidr" {
    type  = string 
    default = "10.0.0.0/16" # CIDR block for the VPC && around 65,536 IP addresses

}

variable "project_name" {
    type = string
    default = "iti-terraform-project"
}

variable "app_ami" {
    type    = string
    default = "ami-04b70fa74e45c3917" # Ubuntu 24.04 LTS in us-east-1
}

variable "bastion_instance_ami" {
    type    = string
    default = "ami-04b70fa74e45c3917" 
}


variable "app_instance_type" {
    type = string
    default = "t3.micro"
}



variable "bastion_instance_type" {
    type = string
    default = "t3.micro"
}