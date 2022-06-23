provider "aws" {
 region = "us-west-2"
}

resource "aws_instance" "test" {
ami = "ami-0cff7528ff583bf9a"
instance_type = "t2.micro"

tags = {
    Name = "sandbox test"
    }
}