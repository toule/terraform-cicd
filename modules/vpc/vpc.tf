# Create a VPC
resource "aws_vpc" "mainvpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
  	Name = "${var.project}-VPC"
  }
}

resource "aws_subnet" "publicA" {
  vpc_id     = "${aws_vpc.mainvpc.id}"
  availability_zone = "${var.region}a"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "${var.project}-Public-A"
  }
}

resource "aws_subnet" "publicC" {
  vpc_id     = "${aws_vpc.mainvpc.id}"
  availability_zone = "${var.region}c"
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "${var.project}-Public-C"
  }
}

resource "aws_subnet" "privateA" {
  vpc_id     = "${aws_vpc.mainvpc.id}"
  availability_zone = "${var.region}a"
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "${var.project}-Private-A"
  }
}

resource "aws_subnet" "privateC" {
  vpc_id     = "${aws_vpc.mainvpc.id}"
  availability_zone = "${var.region}c"
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "${var.project}-Private-C"
  }
}

resource "aws_eip" "nateip" {
  vpc = true
}

resource "aws_internet_gateway" "igw" {
    vpc_id = "${aws_vpc.mainvpc.id}"

    tags = {
        Name = "${var.project}-IGW"
    }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.nateip.id}"
  subnet_id     = "${aws_subnet.publicA.id}"

  tags = {
    Name = "${var.project}-NAT"
  }
}

resource "aws_route_table" "publicRT" {
    vpc_id = "${aws_vpc.mainvpc.id}"
    route {
        cidr_block="${var.any}"
        gateway_id = "${aws_internet_gateway.igw.id}"
    }
    tags = {
        Name = "Public-RT"
    }
}

resource "aws_route_table_association" "publicA" {
    subnet_id = "${aws_subnet.publicA.id}"
    route_table_id = "${aws_route_table.publicRT.id}"
}

resource "aws_route_table_association" "publicC" {
    subnet_id = "${aws_subnet.publicC.id}"
    route_table_id = "${aws_route_table.publicRT.id}"
}

resource "aws_route_table" "privateRT" {
    vpc_id = "${aws_vpc.mainvpc.id}"
    route {
        cidr_block="${var.any}"
        gateway_id = "${aws_nat_gateway.nat.id}"
    }
    tags = {
        Name = "Private RT"
    }
}

resource "aws_route_table_association" "privateA" {
    subnet_id = "${aws_subnet.privateA.id}"
    route_table_id = "${aws_route_table.privateRT.id}"
}

resource "aws_route_table_association" "privateC" {
    subnet_id = "${aws_subnet.privateC.id}"
    route_table_id = "${aws_route_table.privateRT.id}"
}
