module "dev" {
    # source = "github.com/CloudTechDevOps/terraform-10-30am/day-2-basic-ec2"
    ami = "ami-0146fc9ad419e2cfd"
    instance_type ="t2.micro"
    key_name = "luffy"


  
}