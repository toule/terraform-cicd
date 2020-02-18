output "vpc_id" {
	value = "${aws_vpc.mainvpc.id}"
}

output "public_subnetA" {
	value = "${aws_subnet.publicA.id}"
}

output "public_subnetC" {
	value = "${aws_subnet.publicC.id}"
}

output "private_subnetA" {
	value = "${aws_subnet.privateA.id}"
}

output "private_subentC" {
	value = "${aws_subnet.privateC.id}"
}

output "state_dir" {
	value = "basic_private/state/vpc/terraform.tfstate"
}
