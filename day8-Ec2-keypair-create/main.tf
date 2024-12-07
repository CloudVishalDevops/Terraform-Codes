resource "aws_key_pair" "luffy" {
    key_name = "luffy"
    public_key = file("~/.ssh/id_ed25519.pub") #here you need to define public key file path

  
}

resource "aws_instance" "luffy" {
  ami                    = "ami-0146fc9ad419e2cfd"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.luffy.key_name
  tags = {
    Name="key-tf"
  }
}