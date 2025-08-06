output "sg_info" {
    value = {
        security_group_id = aws_security_group.mysg.id
    }
}
output "nacl_info" {
    value = {
        nacl_id = aws_network_acl.mynacl.id
    }
}