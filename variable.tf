variable "ami_id" {}
variable "key_name" {}
variable "instance_type" {}
variable "vpc_cidr" {}
variable "sub1_cidr" {}
variable "sub2_cidr" {}
variable "zone1" {}
variable "zone2" {}
variable "public_ip" {
    type = bool
    default = true
}
variable "ec2_tags" {
    type = map(string)
}
variable "allow_ports" {
  type = list(number)
}
variable "nacl_ports" {
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