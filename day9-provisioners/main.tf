# Define the AWS provider configuration.
provider "aws" {
  region = "ap-southeast-2"  # Replace with your desired AWS region.
}


resource "aws_key_pair" "luffy" {
  key_name   = "luffy"  # Replace with your desired key name
  public_key = file("~/.ssh/id_ed25519.pub") 


}

resource "aws_vpc" "luffy" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "sub1" {
  vpc_id                  = aws_vpc.luffy.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-southeast-2"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "luffy" {
  vpc_id = aws_vpc.luffy.id
}

resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.luffy.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.luffy.id
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.sub1.id
  route_table_id = aws_route_table.RT.id
}

resource "aws_security_group" "luffySg" {
  name   = "luffy"
  vpc_id = aws_vpc.luffy.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "luffy-sg"
  }
}

resource "aws_instance" "server" {
  ami                    = "ami-0146fc9ad419e2cfd"
  instance_type          = "t2.micro"
  key_name      = aws_key_pair.luffy.key_name
  vpc_security_group_ids = [aws_security_group.luffySg.id]
  subnet_id              = aws_subnet.sub1.id

  connection {
    type        = "ssh"
    user        = "ubuntu"  # Replace with the appropriate username for your EC2 instance
    # private_key = file("C:/Users/veerababu/.ssh/id_rsa")
    private_key = file("~/.ssh/id_ed25519")  #private key path
    host        = self.public_ip
  }
  # local execution procee 
 provisioner "local-exec" {
    command = "touch file500"
   
 }
  # File provisioner to copy a file from local to the remote EC2 instance
  provisioner "file" {
    source      = "file10"  # Replace with the path to your local file
    destination = "/home/ubuntu/file10"  # Replace with the path on the remote instance
  }
  # remote execution process 
  provisioner "remote-exec" {
    inline = [
"touch file200",
"echo hello from aws >> file200",
]
 }
}

 