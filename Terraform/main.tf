provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "jenkins" {
  instance_type = "t2.medium"
  ami = "ami-0667149a69bc2c367"
  security_groups = [aws_security_group.jenkins-sg.name]
  key_name = "jenkins"
  tags = {
    "Name" = "Jenkins"
  }
}

resource "aws_instance" "tomcat-docker" {
  instance_type = "t2.micro"
  ami = "ami-0667149a69bc2c367"
  key_name = "tomcat"
  security_groups = [aws_security_group.jenkins-sg.name]
  tags = {
    "Name" = "Tomcat"
  }
}


resource "aws_security_group" "jenkins-sg" {
  name = "jenkins-sg"

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "TCP"
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
