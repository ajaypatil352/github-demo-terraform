resource "aws_instance" "ec2_demo1" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = "subnet-09aa2e2c01388420f"
  vpc_security_group_ids = [aws_security_group.ec2_demo1_sg.id]

  tags = {
    Name = "Created_By_Terraform_Automation1"
  }

  user_data = <<-EOF
              #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Welcome to Terraform Demo!!!, I am $(hostname -f) hosted by Terraform" > /var/www/html/index.html
              EOF

}