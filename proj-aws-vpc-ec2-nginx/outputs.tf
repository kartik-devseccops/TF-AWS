
output "instance_public_ip" {
  description = "The public IP Adress of EC2 instance"
  value = aws_instance.nginxserver.public_ip
}

output "instance_url" {
  description = "The URL to access the Nginx Server"
  value = "http://${aws_instance.nginxserver.public_ip}"
}