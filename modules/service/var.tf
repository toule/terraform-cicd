variable "project" {
	description = "project name"
}

variable "region" {
	description = "aws region"
}

variable "instance_type" {
	description = "aws instance type"
}

variable "ami" {
	description = "amazion machine image"
}

variable "public_subnetA" {
	description = "aws vpc subnet"
}

variable "public_subnetC" {
	description = "aws vpc subnet"
}

variable "private_subnetA" {
	description = "aws vpc subnet"
}

variable "web_sg" {
	description = "web security group"
}

variable "ssh_sg" {
	description = "ssh security group"
}

variable "http" {
	description = "http port"
}

variable "vpc_id" {
	description = "vpc id"
}
