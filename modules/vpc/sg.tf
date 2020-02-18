resource "aws_security_group" "ssm_sg" {
    vpc_id = "${aws_vpc.mainvpc.id}"
    name = "allow_https"
    description = "https only"
    ingress {
        from_port = "${var.https}"
        to_port = "${var.https}"
        protocol = "tcp"
        cidr_blocks = ["${var.any}"]
    }
    egress {
        from_port = 0
        to_port = 0
        cidr_blocks = ["${var.any}"]
        protocol = -1
    }
}
