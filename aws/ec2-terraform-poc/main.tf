variable "my_access_key" {
  description = "Access-key-for-AWS"
  default = "no_access_key_value_found"
}
 
variable "my_secret_key" {
  description = "Secret-key-for-AWS"
  default = "no_secret_key_value_found"
}
 
provider "aws" {
	region = "eu-west-3"
  access_key = var.my_access_key
	secret_key = var.my_secret_key
        
}

resource "aws_instance" "foo" {
  ami           = "ami-0042da0ea9ad6dd83" // "ami-031eb8d942193d84f" Ubuntu Server 22.04 LTS (HVM), SSD Volume Type eu-west-3
  instance_type = "t2.micro"
  key_name = "ec2-key-pair-2"

  network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }

  tags = {
		Name = "my-t2.micro"
	}

  }



resource "aws_vpc" "terraform_vpc" {
  cidr_block = "172.16.0.0/16"
  }
resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "eu-west-3a"
}
resource "aws_internet_gateway" "terraform_gw" {
vpc_id = aws_vpc.terraform_vpc.id
}
resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]
  tags = {
    Name = "primary_network_interface"
  }
}
resource "aws_eip" "terraform_eip" {
vpc = true
}
resource "aws_eip_association" "terraform_eip_assoc" {
instance_id   = aws_instance.foo.id
allocation_id = aws_eip.terraform_eip.id
}







