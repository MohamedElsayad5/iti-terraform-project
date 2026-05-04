variable "region" {
    type = string
    default = "us-east-1"
}

variable "vpc_cider" {
    type  = string 
    default = "10.0.0.0/16" # CIDR block for the VPC && around 65,536 IP addresses

}

variable "project_name" {
    type = string
    default = "iti-terraform-project"
}