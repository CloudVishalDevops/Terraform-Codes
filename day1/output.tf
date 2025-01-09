resource "aws_instance" "luffy" {
  ami           = "ami-0d6560f3176dc9ec0"  # Replace with the correct AMI ID
  instance_type = "t2.micro"               # Replace with your desired instance type
  tags = {
    Name = "Luffy"
  }
}

output "instance_public_ip" {
  value     = aws_instance.luffy.public_ip
  sensitive = true
}

output "instance_id" {
  value = aws_instance.luffy.id
}

output "instance_public_dns" {
  value = aws_instance.luffy.public_dns
}

output "instance_arn" {
  value = aws_instance.luffy.arn
}
