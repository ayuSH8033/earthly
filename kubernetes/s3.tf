provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.region}"
}

module "s3" {
    source = "/exp/new"
    bucket_name = "earth-bucket"       
}

resource "aws_s3_bucket" "temps3" {
    acl = "${var.acl_value}"   
}