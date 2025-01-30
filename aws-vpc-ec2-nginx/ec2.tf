
// EC2 instance creation for public subnet
resource "aws_instance" "nginxserver" {
ami                         = var.ami
subnet_id                   = aws_subnet.public-subnet.id
instance_type               = var.instance_type
vpc_security_group_ids      = [ aws_security_group.nginx-sg.id ]
associate_public_ip_address = true

user_data = <<-EOF
              #!/bin/bash
              sudo yum install nginx -y
              sudo systemctl start nginx
              EOF


tags ={
    Name = var.name_tag
}  
}