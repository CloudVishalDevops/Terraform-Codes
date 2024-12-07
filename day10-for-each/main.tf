variable "ami" {
  type    = string
  default = "ami-0146fc9ad419e2cfd"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}


variable "subnet_id" {
    type = string
    default = "subnet-06e52282c552d43aa"
  
}
variable "sandboxes" {
  type    = list(string)
  default = ["dev",  "prod"]
}

resource "aws_instance" "sandbox" {
  ami           = var.ami
  instance_type = var.instance_type
#   count = length(var.sandboxes)
  for_each      = toset(var.sandboxes)
#   subnet_id = var.subnet_id
#   count = length(var.sandboxes)
  tags = {
    Name = each.value # for a set, each.value and each.key is the same
  }
}