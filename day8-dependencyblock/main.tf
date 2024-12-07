 #creating s3 bucket and dynamo DB for state backend storgae and applying the lock mechanisam for statefile

provider "aws" { 
    region = "ap-southeast-2"
}



resource "aws_s3_bucket" "example" {
  bucket = "qwertyuiopasdfg"
  depends_on = [ aws_instance.luffy ]
}



resource "aws_instance" "luffy" {
    ami = "ami-0146fc9ad419e2cfd"
    instance_type = "t2.micro"
    
}



 