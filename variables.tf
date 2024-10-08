variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
  default     = "pel-mod-vpc"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  type        = list(string)
  description = "Availability zones for the VPC"
  default     = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

variable "private_subnets" {
  type        = list(string)
  description = "Private subnets for the VPC"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets" {
  type        = list(string)
  description = "Public subnets for the VPC"
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "ec2_name" {
  type        = string
  description = "Name of the EC2 instance"
  default     = "pel-mod-ec2"
}

variable "ec2_instance" {
  type        = string
  description = "EC2 instance type"
  default     = "t3.micro"
}