variable "vpc_cidr" {
  type = string

}

variable "public_subnets" {
    type = list(string)
    default = [ "10.0.1.0/24", "10.0.2.0/24" ]
  
}

variable "private_subnets" {
    type = list(string)
    default = [ "10.0.3.0/24", "10.0.4.0/24" ]
  
}

