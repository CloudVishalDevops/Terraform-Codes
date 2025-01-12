variable "rds-password" {
    description = "rds password"
    type = string
    default = "vishal9094"
  
}
variable "rds-username" {
    description = "rds username"
    type = string
    default = "admin"
  
}
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
    default = "ap-southeast-2"
  
}
variable "backupr-retention" {
    type = number
    default = "7"
  
}