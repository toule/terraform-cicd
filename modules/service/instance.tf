resource "aws_instance" "nginx_ec2" {
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    availability_zone = "${var.region}a"
    vpc_security_group_ids = ["${var.web_sg}","${var.ssh_sg}"]
    associate_public_ip_address = true
    key_name = "${aws_key_pair.terraform_keypair.id}"
    subnet_id = "${var.private_subnetA}"
#    user_data = "${data.template_file.userdata.rendered}"
	iam_instance_profile = "${aws_iam_instance_profile.terraform_ec2_profile.name}"
    tags = {
        Name = "${var.project}-EC2",
		filter = "dev"
    }
}
