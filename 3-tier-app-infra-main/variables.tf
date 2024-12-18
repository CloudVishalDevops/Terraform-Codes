variable "ami" {
    description = "ami"
    type = string
    default = "ami-0d6560f3176dc9ec0"

  
}
variable "instance-type" {
    description = "instance-type"
    type = string
    default = "t2.micro"
  
}
variable "key-name" {
    description = "keyname"
    type = string
    default = "om"
  
}