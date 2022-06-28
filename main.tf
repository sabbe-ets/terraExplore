provider "aws" {
 region = "us-west-2"
}

resource "aws_instance" "test" {
ami = "ami-098e42ae54c764c35"
instance_type = "t2.micro"
vpc_security_group_ids = [aws_security_group.instance.id]

user_data = <<-EOF
            #!/bin/bash
            echo "hello world" >index.html
            nohub busybox httpd -f -p 8080 &
            EOF
tags = {
    Name = "sandbox test"
    Acct = "scottsand"
    Nonsense = "you don't have to put out the red light"
    }
}
resource "aws_security_group" "instance" {
    name = "sandbox-example-instance"
    ingress { 
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

