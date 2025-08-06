variable "ami_id" {}
variable "key_name" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "sg_id" {}
variable "user_data" {}
variable "ec2_tags" {
  type = map(string)
}