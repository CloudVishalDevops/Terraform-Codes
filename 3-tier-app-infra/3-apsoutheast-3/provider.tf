provider "aws" {  
  region = "ap-southeast-2"
  }
provider "aws" {
  alias  = "secondary"  
  region = "ap-southeast-2"
}