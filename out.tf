output "public_ip" {
  value = aws_instance.ec2_demo1.public_ip
}

output "private_ip" {
  value = aws_instance.ec2_demo1.private_ip
}
