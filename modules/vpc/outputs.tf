output "vpc_info" {
    value = {
        vpc_id = aws_vpc.myvpc.id
    }
}

output "public_subnet_info"{
    value = {
        subnet_id = aws_subnet.publicsub.id
    }
}
output "private_subnet_info"{
    value = aws_subnet.privatesub.id
}
output "gateways_info" {
    description = "here is he id's of igw and natgw"
    value = {
        internet_gateway = aws_internet_gateway.mygtw.id
        nat_gateway_id = aws_nat_gateway.natgtw.id
    }
}