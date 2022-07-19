provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "test" {
  ami                    = "ami-098e42ae54c764c35"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
            #!/bin/bash
            echo "hello world" >index.html
            nohub busybox httpd -f -p ${var.server_port} &
            EOF

  # interpolation ${...} replaced 8080  

  tags = {
    Name     = "sandbox test"
    Acct     = "scottsand"
    Nonsense = "you don't have to put out the red light"
  }
}
resource "aws_security_group" "instance" {
  name = "sandbox-example-instance"
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# variable reference (line 24 and 25)
variable "server_port" {
  description = "port server will use for http requests"
  type        = number
  default     = 8080
}

# ouput variable
output "public_ip" {
  value       = aws_instance.test.public_ip
  description = "the public IP of this test"
}