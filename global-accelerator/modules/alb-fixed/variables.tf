variable region {
    description = "the deploy region"
    type = string
}

variable subnets_id {
    description = "an list of subnet where the ALB will be deployed, you need to specify at least 2"
    type = list 
}

variable "name" {
  description = "name for Security group and ALB"
  type = string
}