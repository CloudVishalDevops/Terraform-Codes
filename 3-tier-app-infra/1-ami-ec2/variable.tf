variable "ami" {
    description = "ami"
    type = string
    default = "ami-0a8f40a451672ea1d"
  
}
variable "instance-type" {
    description = "instance-type"
    type = string
    default = "t2.micro"
  
}
variable "key-name" {
    description = "keyname"
    type = string
    default = "aws_key"
  
}