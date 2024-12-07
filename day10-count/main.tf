# create instance 

resource "aws_instance" "luffy" {
    ami =  "ami-0146fc9ad419e2cfd"
    instance_type = "t2.micro"
    key_name =  "luffy"
    count = length(var.sandboxes)
    tags = {
    #   Name = "web"
    #   Name = "web-${count.index}"
        Name = var.sandboxes[count.index]
    }

}

variable "sandboxes" {
  type    = list(string)
  default = [ "dev", "prod"]
}