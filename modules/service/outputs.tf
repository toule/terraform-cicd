output "ec2_id" {
	value = "${aws_instance.nginx_ec2.id}" 
}

output "state_dir" {
	value = "basic_private/state/ec2/terraform.tfstate"
}
