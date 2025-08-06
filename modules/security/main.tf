resource "aws_security_group" "mysg"{
    vpc_id = var.vpc_id

    dynamic "ingress" {
        for_each = var.allow_ports
        content {
          from_port = ingress.value
          to_port = ingress.value
          protocol = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
    }
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = var.sg_tags
}
resource "aws_network_acl" "mynacl" {
    vpc_id = var.vpc_id
    subnet_ids = [var.subnet_id]
    tags = var.nacl_tags
}
resource "aws_network_acl_rule" "ingress" {
    for_each = var.nacl_ports
    network_acl_id = aws_network_acl.mynacl.id   
    rule_number = each.value + 100
    rule_action = "allow"
    egress = false
    from_port = each.value
    to_port = each.value
    protocol = "tcp"
    cidr_block = "0.0.0.0/0"
}
resource "aws_network_acl_rule" "egress"{
    network_acl_id = aws_network_acl.mynacl.id
    rule_number = var.rule_number
    rule_action = "allow"
    egress = true
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_block = "0.0.0.0/0"

}
