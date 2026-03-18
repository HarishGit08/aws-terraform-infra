module "vpc" {
  source = "./modules/vpc"

  project_name          = var.project_name
  vpc_cidr              = var.vpc_cidr
  public_subnet_1_cidr  = var.public_subnet_1_cidr
  public_subnet_2_cidr  = var.public_subnet_2_cidr
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr
  db_subnet_1_cidr      = var.db_subnet_1_cidr
  db_subnet_2_cidr      = var.db_subnet_2_cidr
}

module "iam" {
  source = "./modules/iam"

  project_name = var.project_name
}

module "alb" {
  source = "./modules/alb"

  project_name      = var.project_name
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
}

module "asg" {
  source = "./modules/asg"

  project_name          = var.project_name
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  key_name              = var.key_name
  private_subnet_ids    = module.vpc.private_subnet_ids
  vpc_id                = module.vpc.vpc_id
  target_group_arn      = module.alb.target_group_arn
  instance_profile_name = module.iam.instance_profile_name
  alb_sg_id             = module.alb.alb_sg_id
}

module "rds" {
  source = "./modules/rds"

  project_name  = var.project_name
  db_name       = var.db_name
  db_username   = var.db_username
  db_password   = var.db_password
  vpc_id        = module.vpc.vpc_id
  db_subnet_ids = module.vpc.db_subnet_ids
  app_sg_id     = module.asg.app_sg_id
}

module "s3" {
  source = "./modules/s3"

  project_name = var.project_name
}

module "monitoring" {
  source = "./modules/monitoring"

  project_name = var.project_name
  asg_name     = module.asg.asg_name
  alarm_email  = var.alarm_email
}

module "ec2" {
  source = "./modules/ec2"

  project_name  = var.project_name
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = module.vpc.public_subnet_ids[0]
  vpc_id        = module.vpc.vpc_id
}