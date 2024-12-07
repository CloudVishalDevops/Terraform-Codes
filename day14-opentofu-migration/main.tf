#create instance 

resource "aws_instance" "luffy-ec2" {
    ami = "ami-0146fc9ad419e2cfd"
    instance_type = "t2.micro"
    key_name = "luffy"
    tags = {
      Name = "luffy-ec2"
    }
}