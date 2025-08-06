module "vpc" {
  source     = "./modules/vpc"
  vpc_cidr   = var.vpc_cidr
  sub1_cidr  = var.sub1_cidr
  sub2_cidr  = var.sub2_cidr
  zone1      = var.zone1
  zone2      = var.zone2
  public_ip  = var.public_ip
  
}

module "security" {
  source     = "./modules/security"
  vpc_id     = module.vpc.vpc_info.vpc_id
  subnet_id  = module.vpc.public_subnet_info.subnet_id
  allow_ports = var.allow_ports
  nacl_ports  = var.nacl_ports
  rule_number = var.rule_number
  sg_tags    = var.sg_tags
  nacl_tags  = var.nacl_tags
}

module "ec2" {
  source        = "./modules/ec2"
  subnet_id     = module.vpc.public_subnet_info.subnet_id
  ami_id        = var.ami_id
  key_name      = var.key_name
  instance_type = var.instance_type
  sg_id         = module.security.sg_info.security_group_id
  user_data     = file("${path.module}/software.sh")
  ec2_tags      = var.ec2_tags
}
