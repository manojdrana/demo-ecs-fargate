module "ecs_vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "${local.prefix}-vpc"
  cidr = local.vpc_cidr
  azs             = var.availability_zones
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  enable_nat_gateway     = true
  enable_dns_hostnames   = true
  one_nat_gateway_per_az = true
  tags = local.common_tags
}