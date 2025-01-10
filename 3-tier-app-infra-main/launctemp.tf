# Frontend AMI Data Source
data "aws_ami" "example0" {
  most_recent = true
  owners      = ["self"]  # Replace with the AWS account ID if needed
  filter {
    name   = "name"
    values = ["frontend-ami*"]  # Match AMIs starting with 'frontend-ami', adjust as necessary
  }
}

# Backend AMI Data Source
data "aws_ami" "example" {
  most_recent = true
  owners      = ["self"]  # Replace with the AWS account ID if needed
  filter {
    name   = "name"
    values = ["backend-ami*"]  # Match AMIs starting with 'backend-ami', adjust as necessary
  }
}

# Frontend Launch Template
resource "aws_launch_template" "frontend" {
  name                    = "frontend-terraform"
  description             = "frontend-terraform"
  image_id                = data.aws_ami.example0.id
  instance_type           = "t2.micro"
  vpc_security_group_ids  = [aws_security_group.frontend-server-sg.id]
  key_name                = "your-key-pair-name"  # Replace with actual key pair name
  user_data               = filebase64("${path.module}/frontend-lt.sh")  # Ensure the file exists
  update_default_version  = true
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "frontend-terraform"
    }
  }
}

# Backend Launch Template
resource "aws_launch_template" "backend" {
  name                    = "backend-terraform"
  description             = "backend-terraform"
  image_id                = data.aws_ami.example.id
  instance_type           = "t2.micro"
  vpc_security_group_ids  = [aws_security_group.backend-server-sg.id]
  key_name                = "your-key-pair-name"  # Replace with actual key pair name
  user_data               = filebase64("${path.module}/backend-it.sh")  # Ensure the file exists
  update_default_version  = true
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "backend-terraform"
    }
  }
}
