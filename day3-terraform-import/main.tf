resource "aws_instance" "luffy_server" {
    ami = "ami-0146fc9ad419e2cfd"
    instance_type = "t2.medium"

    tags = {
      Name="ec2"
    }
  
}

resource "aws_s3_bucket" "luffy" {
    bucket = "importbuckett"
  
}