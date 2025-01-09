resource "aws_instance" "luffy" {
    ami =  "ami-0d6560f3176dc9ec0"
    instance_type = "t2.micro"
    # key_name = var.key_name
    # subnet_id = aws_subnet.dev.id
    # security_groups = [aws_security_group.allow_tls.id]
    tags = {
      Name = "luffy-developer-1"
    }
}