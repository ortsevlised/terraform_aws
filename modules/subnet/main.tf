resource "aws_subnet" "subnets" {
  for_each = var.subnets

  vpc_id                  = var.vpc_id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = each.value.type == "public"

  tags = {
    Name = "${title(each.key)} Subnet"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gw
  }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table_association" "public_rta" {
  for_each = {
    for k, v in var.subnets :
    k => v if v.type == "public"
  }

  subnet_id      = aws_subnet.subnets[each.key].id
  route_table_id = aws_route_table.public_rt.id
}
