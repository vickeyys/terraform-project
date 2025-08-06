resource "aws_vpc"  "myvpc"{
    cidr_block = var.vpc_cidr
    tags = {
        Name = "myvpc"
    }
}
resource "aws_subnet" "publicsub" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.sub1_cidr
    availability_zone = var.zone1
    map_public_ip_on_launch = var.public_ip
    tags = {
        Name = "publicsub"
    }
}
resource "aws_subnet" "privatesub" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.sub2_cidr
    availability_zone = var.zone2
    tags = {
        Name = "privatesub"
    }
}
resource "aws_internet_gateway" "mygtw"{
    vpc_id = aws_vpc.myvpc.id
    tags = {
      Name = "mygtw"
    }
}
resource "aws_eip" "myeip" {
    domain = "vpc"
}
resource "aws_nat_gateway" "natgtw" {
    subnet_id = aws_subnet.publicsub.id
    allocation_id = aws_eip.myeip.id
    tags = {
        Name = "natgtw"
    }
}
resource "aws_route_table" "publicrt" {
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.mygtw.id
    }
    tags = {
        Name = "publicrt"
    }
}
resource "aws_route_table" "privatert" {
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.natgtw.id
    }
    tags = {
        Name = "privatert"
    }
}
resource "aws_route_table_association" "publicrttosub" {
    route_table_id = aws_route_table.publicrt.id
    subnet_id = aws_subnet.publicsub.id
}
resource "aws_route_table_association" "privaterttosub" {
    route_table_id = aws_route_table.privatert.id
    subnet_id = aws_subnet.privatesub.id
}
