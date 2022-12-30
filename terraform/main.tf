terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

#Creating EC2 Instance
resource "aws_instance" "my-first-instance" {
  ami = "ami-0574da719dca65348"
  instance_type = "t2.micro"
  tags = {
    "Name" = "ubuntu-server"
  }
}
#Creating VPC
resource "aws_vpc" "my-frst-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        "Name" = "Dhanya-VPC"
    }
}
# Creating Subnet
resource "aws_subnet" "my-subnet" {
    vpc_id = aws_vpc.my-frst-vpc.id
    cidr_block = "10.0.1.0/24"
    tags = {
        "Name" = "Dhanya-Subnet"
   }
 }
output "vpc_id" {
  description = "ID of project VPC"
  value       = aws_vpc.my-frst-vpc.id
}
