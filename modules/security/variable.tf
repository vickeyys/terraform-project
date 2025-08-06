variable "vpc_id" {}
variable "subnet_id"{}

variable "allow_ports" {
    type = list(number)
}
variable "nacl_ports"{
    type = map(number)
}
variable "rule_number"{
    type = number
}
variable "sg_tags" {
    type = map(string)
}
variable "nacl_tags" {
    type = map(string)
}