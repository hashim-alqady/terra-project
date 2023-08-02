#resource "aws_vpc" "my_vpc" {
 # cidr_block = "10.0.0.0/16"
  #enable_dns_support = true
  #enable_dns_hostnames = true

  #tags = {
   # Name = "test"
  #}
  #}

    resource "aws_key_pair" "ssh_key" {
  key_name   = "ssh_key"
  public_key = file("~/.ssh/id_rsa.pub")
}


  resource "aws_instance" "my-instance" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ssh_key.key_name
  #subnet_id     = "your_subnet_id"
  security_groups = ["${aws_security_group.upuntusg.name}"]

  tags = {
    Name = "my-instance"

  user_data = <<-EOF
              #!/bin/bash
              echo "${aws_key_pair.ssh_key.public_key}" >> /home/ubuntu/.ssh/authorized_keys
              chmod 600 /home/ubuntu/.ssh/authorized_keys
              chown ubuntu:ubuntu /home/ubuntu/.ssh/authorized_keys
              EOF
  }
}



