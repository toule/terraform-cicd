provider "aws" {
	region = "${var.region}"
}

module "vpc" {
	source = "../modules/vpc"
	project = "${var.project}"
	region = "${var.region}"
}

module "service" {
	source = "../modules/service"
	project = "${var.project}"
	region = "${var.region}"
	instance_type = "${var.instance_type}"
	ami = "ami-0a93a08544874b3b7"
	private_subnetA = "${module.vpc.private_subnetA}"
	web_sg = "${aws_security_group.web_sg.id}"
	ssh_sg = "${aws_security_group.ssh_sg.id}"
}

resource "aws_security_group" "web_sg" {
    vpc_id = "${module.vpc.vpc_id}"
    name = "web_sg"
    description = "http port allow"
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["${var.any}"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["${var.any}"]
    }
}

resource "aws_security_group" "ssh_sg" {
    vpc_id = "${module.vpc.vpc_id}"
    name = "ssh_sg"
    description = "ssh port allow"
    ingress {
        from_port = 20
        to_port = 20
        protocol = "tcp"
        cidr_blocks = ["${var.any}"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["${var.any}"]
    }
}
