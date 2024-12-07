provider "aws" {
  
}


data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["test"] # insert value here
  }
}

resource "aws_instance" "name" {
    ami= "ami-0146fc9ad419e2cfd" 
    key_name = "luffy"
    instance_type ="t2.nano"
    tags = {
      Name="luffy"
    }
} 