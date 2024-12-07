#create a VPC 
 
resource "aws_vpc" "luffy" { 
  cidr_block = "10.0.0.0/16" 
 
  tags = { 
   Name="luffy"  
  } 
 
} 
 
 
 #create subnet 
 
resource "aws_subnet" "luffy" { 
  vpc_id = aws_vpc.luffy.id 
  cidr_block = "10.0.0.0/24" 
 
tags = { 
  Name="luffy_subnet" 
  } 
} 
 
#create Internet gateway attach to VPc 
resource "aws_internet_gateway" "luffy_ig" { 
    vpc_id = aws_vpc.luffy.id 
   
} 
 
#create a Route table edit routes 
resource "aws_route_table" "luffy_rt" { 
    vpc_id = aws_vpc.luffy.id 
route { 
    cidr_block = "0.0.0.0/0" 
    gateway_id = aws_internet_gateway.luffy_ig.id 
  } 
} 
 
#subnet association 
resource "aws_route_table_association" "lufy_routes" { 
  subnet_id = aws_subnet.luffy.id 
  route_table_id = aws_route_table.luffy_rt.id 
 
} 
 
 
#create security group 
 
resource "aws_security_group" "allow_tls" { 
  name        = "allow_tls" 
  vpc_id      = aws_vpc.luffy.id 
  tags = { 
    Name = "dev_sg" 
  } 
 ingress { 
    description      = "TLS from VPC" 
    from_port        = 80 
    to_port          = 80 
    protocol         = "tcp" 
    cidr_blocks      = ["0.0.0.0/0"] 
     
  } 
ingress { 
    description      = "TLS from VPC" 
    from_port        = 22 
    to_port          = 22 
    protocol         = "TCP" 
    cidr_blocks      = ["0.0.0.0/0"] 
     
  } 
egress { 
    from_port        = 0 
    to_port          = 0 
    protocol         = "-1" 
    cidr_blocks      = ["0.0.0.0/0"] 
     
  } 
 
 
  }