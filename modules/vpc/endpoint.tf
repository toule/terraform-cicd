resource "aws_vpc_endpoint" "s3" {
  vpc_id       = "${aws_vpc.mainvpc.id}"
  service_name = "com.amazonaws.${var.region}.s3"
  route_table_ids = ["${aws_route_table.privateRT.id}"]

  tags = {
    Environment = "s3_endpoint"
  }
}

resource "aws_vpc_endpoint" "ssm" {
  vpc_id            = "${aws_vpc.mainvpc.id}"
  service_name      = "com.amazonaws.${var.region}.ssm"
  vpc_endpoint_type = "Interface"
  subnet_ids        = ["${aws_subnet.privateA.id}","${aws_subnet.privateC.id}"]

  security_group_ids = [
    "${aws_security_group.ssm_sg.id}"
  ]

  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ec2messages" {
  vpc_id            = "${aws_vpc.mainvpc.id}"
  service_name      = "com.amazonaws.${var.region}.ec2messages"
  vpc_endpoint_type = "Interface"
  subnet_ids        = ["${aws_subnet.privateA.id}","${aws_subnet.privateC.id}"]

  security_group_ids = [
    "${aws_security_group.ssm_sg.id}"
  ]

  private_dns_enabled = true
}
