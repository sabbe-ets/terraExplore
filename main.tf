provider "aws" {
 region = "us-west-2"
}

resource "aws_instance" "test" {
ami = "ami-098e42ae54c764c35"
instance_type = "t2.micro"

tags = {
    Name = "sandbox test"
    }
}