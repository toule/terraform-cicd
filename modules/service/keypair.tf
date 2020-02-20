resource "aws_key_pair" "terraform_keypair" {
    key_name = "key_terraform.pem"
    public_key = "${file("${path.module}/keypair_terraform.pub")}"
}
