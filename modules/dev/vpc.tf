# create a vpc manged by terraform
resource "aws_vpc" "devvpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "terrafrom-manage-vpc"
  }
}

# crate a subnet for public
resource "aws_subnet" "devsubnet1" {
  vpc_id     = aws_vpc.devvpc.id
  cidr_block = var.subnet_cidr[0]
  availability_zone = var.subnet_az[0]
  map_public_ip_on_launch = true
  
  tags = {
    Name = "devvpc-subnet-pub1-az1"
  }
}

resource "aws_subnet" "devsubnet2" {
  vpc_id     = aws_vpc.devvpc.id
  cidr_block = var.subnet_cidr[1]
  availability_zone = var.subnet_az[1]
  map_public_ip_on_launch = true
  
  tags = {
    Name = "devvpc-subnet-pub2-az2"
  }
}

# crate a subnet for private 
resource "aws_subnet" "devsubnet3" {
  vpc_id     = aws_vpc.devvpc.id
  cidr_block = var.subnet_cidr[2]
  availability_zone = var.subnet_az[0]
  map_public_ip_on_launch = false
  
  tags = {
    Name = "devvpc-subnet-pri1-az1"
  }
}

resource "aws_subnet" "devsubnet4" {
  vpc_id     = aws_vpc.devvpc.id
  cidr_block = var.subnet_cidr[3]
  availability_zone = var.subnet_az[0]
  map_public_ip_on_launch = false
  
  tags = {
    Name = "devvpc-subnet-pri1-az1"
  }
}

# crate a internet gateway for vpc 
resource "aws_internet_gateway" "devvpcigw" {
  vpc_id = aws_vpc.devvpc.id

  tags = { 
    Name = "devvpc-igw"
  }
}

# create a route tables for vpc 
resource "aws_route_table" "devvpcpubrt" {
  vpc_id = aws_vpc.devvpc.id

  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devvpcigw.id
  }
  tags = { 
    Name = "devvpc-vpc-public-rt"
  }
}

resource "aws_route_table" "devvpcprirt" {
  vpc_id = aws_vpc.devvpc.id
  tags = { 
    Name = "devvpc-vpc-private-rt"
  }
} 