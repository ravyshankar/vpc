//creates a VPC by the name FFW-VPC. Change the name parameter to your required name
resource "aws_vpc" "mainvpc" {
  cidr_block = "172.16.0.0/16" #//change the cidr_block to your desired value, get the values from your ATFM else do not change it

  tags = {
    Name = "FFW-VPC" #//change FFW to your desired name
  }
}

resource "aws_subnet" "public-subnet" {
  count             = length(var.public-subnet)
  vpc_id            = aws_vpc.mainvpc.id
  cidr_block        = element(var.public-subnet, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "FFW-public-subnet ${count.index + 1}" #//change FFW to your desired name
  }

}

resource "aws_subnet" "private-subnet" {
  count             = length(var.private-subnet)
  vpc_id            = aws_vpc.mainvpc.id
  cidr_block        = element(var.private-subnet, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "FFW-private-subnet ${count.index + 1}" #//change FFW to your desired name
  }

}

resource "aws_subnet" "db-subnet" {
  count             = length(var.db-subnet)
  vpc_id            = aws_vpc.mainvpc.id
  cidr_block        = element(var.db-subnet, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "FFW-db-subnet ${count.index + 1}" #//change FFW to your desired name
  }

}

resource "aws_subnet" "intranet-subnet" {
  count             = length(var.intranet-subnet)
  vpc_id            = aws_vpc.mainvpc.id
  cidr_block        = element(var.intranet-subnet, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "FFW-intranet-subnet ${count.index + 1}" #//change FFW to your desired name
  }

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.mainvpc.id
  tags = {
    Name = "FFW-internet-gateway" #//change FFW to your desired name
  }

}

resource "aws_route_table" "igw-route" {
  vpc_id = aws_vpc.mainvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "igw-route"
  }
}

resource "aws_route_table_association" "public-subnet-igw-association" {
  count          = length(var.public-subnet)
  subnet_id      = element(aws_subnet.public-subnet[*].id, count.index)
  route_table_id = aws_route_table.igw-route.id
}

//creates a VPC by the name FFW-VPC. Change the name parameter to your required 
resource "aws_default_network_acl" "default" {
  default_network_acl_id = aws_vpc.mainvpc.default_network_acl_id

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}
