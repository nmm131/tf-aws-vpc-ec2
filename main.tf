// The resources for this service should go into an existing VPC/subnet
module "vpc" {
  source = "./modules/vpc"
  vpc_id = var.vpc_id
}

// Company has many separate environments (some specific to a single client), and we want this module to be created in a way we can reuse it to easily deploy the new service in all environments
module "ec2" {
  source                 = "./modules/ec2"
  ami_id                 = var.ami_id
  subnet_id              = module.vpc.data.aws_subnet.selected.id
  vpc_security_group_ids = [module.vpc.aws_security_group.sg.id]
}

module "rdb" {
  source                 = "./modules/rdb"
  subnet_ids             = [module.vpc.data.aws_subnet.selected.id]
  username               = var.username
  password               = var.password
  vpc_security_group_ids = [module.vpc.aws_security_group.sg.id]
}

module "lb" {
  source          = "./modules/lb"
  security_groups = [module.vpc.aws_security_group.sg.id]
  subnets         = [module.vpc.data.aws_subnet.selected.id]
  vpc_id          = module.vpc.aws_vpc.selected.id
}

module "vpc-endpoint-service" {
  source          = "./modules/vpc-endpoint-service"
  network_load_balancer_arns = [module.lb.aws_lb.test.arn]
}
