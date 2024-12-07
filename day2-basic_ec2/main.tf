# create instance 

resource "aws_instance" "luffy" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    tags = {
      Name = "luffy-ec3"
    }
}



