#Create a vpc........!!
resource "aws_vpc" "luffy" {
    cidr_block = "10.0.0.0/16"

    tags = {
      Name="main_vpc"
    }
}

#Create subnets.....!!
resource "aws_subnet" "luffy_sub" {
    vpc_id = aws_vpc.luffy.id
    cidr_block = "10.0.0.0/24"

    tags = {
      Name="pub_subnet"
    }
  
}

resource "aws_subnet" "luffy_sub2" {
    vpc_id = aws_vpc.luffy.id
    cidr_block = "10.0.1.0/24"

    tags = {
      Name="prvt_subnet"
    }
  
}

#Create Internet gateway attach to vpc...!!
resource "aws_internet_gateway" "luffy_ig" {
    vpc_id = aws_vpc.luffy.id

     tags = {
       Name="luffy_ig"
    }
}
resource "aws_eip" "luffy_eip" {
  
}

resource "aws_nat_gateway" "luffy_nat" {
    allocation_id = aws_eip.luffy_eip.id
    subnet_id = aws_subnet.luffy_sub.id
  
}

#Create a route table edit routes..!!
resource "aws_route_table" "pub_rt" {
    vpc_id = aws_vpc.luffy.id

    tags = {
      Name="pub_rt"
    }

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.luffy_ig.id
    }
}
resource "aws_route_table" "prvt_rt" {
    vpc_id = aws_vpc.luffy.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.luffy_nat.id
    }
  
  tags = {
    Name="prvt_rt"
  }
}
#Subnet association...!!
resource "aws_route_table_association" "luffy_route" {
  subnet_id = aws_subnet.luffy_sub.id
  route_table_id = aws_route_table.pub_rt.id
  
}

resource "aws_route_table_association" "luffy_rt" {
  subnet_id = aws_subnet.luffy_sub2.id
  route_table_id = aws_route_table.prvt_rt.id
  
}

#Create security group..!!
resource "aws_security_group" "allow_traffic" {
    name    = "allow_traffic"
    vpc_id  = aws_vpc.luffy.id

    tags = {
      Name = "luffy_sg"
    }

    ingress {
        description = "traffic"
        from_port   = 22
        to_port     = 22
        protocol    = "TCP" 
        cidr_blocks = ["0.0.0.0/0"]

    }
    egress {
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }

  
}

resource "aws_instance" "luffy-server" {
    ami = "ami-0146fc9ad419e2cfd"
    instance_type = "t2.micro"
    key_name = "luffy"

    subnet_id = aws_subnet.luffy_sub.id
    associate_public_ip_address = true
    vpc_security_group_ids= [ aws_security_group.allow_traffic.id ]

    tags = {
        Name="pub_01"
    }
}

resource "aws_instance" "luffy-prvt-server" {
    ami = "ami-0146fc9ad419e2cfd"
    instance_type = "t2.micro"
    key_name = "luffy"
    vpc_security_group_ids= [ aws_security_group.allow_traffic.id ]
    subnet_id = aws_subnet.luffy_sub2.id

    tags = {
        Name="prvt_01"
    }
}