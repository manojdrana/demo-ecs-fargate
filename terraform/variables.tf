variable "aws_region" {
  type        = string
  description = "The region in which to create and manage resources"
  default     = "us-east-1"
}
variable "vpc_cidr" {
  default = "12.100.0.0/16"
}
variable "availability_zones" {
  type = list(string)
  description = "the name of availability zones to use subnets"
  default = [ "us-east-1a", "us-east-1b" ]
}
variable "public_subnets" {
  type = list(string)
  description = "the CIDR blocks to create public subnets"
  default = [ "12.100.10.0/24", "12.100.20.0/24" ]
}
variable "private_subnets" {
  type = list(string)
  description = "the CIDR blocks to create private subnets"
  default = [ "12.100.30.0/24", "12.100.40.0/24" ]
}
variable "spring_profile" {
  type        = string
  description = "Environment Name"
  default     = "prd"
}
variable "service_name" {
  type        = string
  description = "ECS Service Name"
  default     = "app"
}