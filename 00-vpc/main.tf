module "vpc" {

   source = "git::https://github.com/Haroon-Md/terraform-aws-vpc.git?ref=main"

    #vpc
    project_name = var.project_name
    environment = var.environment
    vpc_cidr = var.vpc_cidr
    vpc_tags = var.vpc_tags


    #public subnets
    public_subnet_cidrs = var.public_subnet_cidr
    #private subnets
    private_subnet_cidrs = var.private_subnet_cidr

    #database subnets
    database_subnet_cidrs = var.database_subnet_cidr

    is_peering_required = true

}
