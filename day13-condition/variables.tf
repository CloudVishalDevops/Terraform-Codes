variable "create_instance" {
   description = "Set to true to create the EC2 instance."
   type        = bool
   default     = true
 }


 resource "aws_instance" "example" {
   count         = var.create_instance ? 1 : 0
   ami           = "ami-0146fc9ad419e2cfd" # Replace with a valid AMI ID
   instance_type = "t2.micro"

   tags = {
     Name = "Condition-based-Instance"
    }
 }

