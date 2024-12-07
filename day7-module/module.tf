module "dev" {
    source = "../day2-basic_ec2"
     ami = "ami-0146fc9ad419e2cfd"
     instance_type ="t2.micro"
     key_name = "luffy"
     

}