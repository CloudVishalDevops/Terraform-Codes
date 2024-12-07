resource "aws_instance" "luffy" {
    ami =  "ami-0146fc9ad419e2cfd"
    instance_type = "t2.micro"
    # key_name = var.key_name
    # subnet_id = aws_subnet.dev.id
    # security_groups = [aws_security_group.allow_tls.id]
    tags = {
      Name = "luffy-developer-1"
    }
}