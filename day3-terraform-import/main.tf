resource "aws_instance" "luffy_server" {
    ami = "ami-0d6560f3176dc9ec0"
    instance_type = "t2.medium"

    tags = {
      Name="ec2"
    }
  
}

resource "aws_s3_bucket" "luffy" {
    bucket = "importbuckett"
  
}