module "provider" {
  source     = "../../modules/provider"
  aws_region = var.aws_region
}

module "vpc" {
  source       = "../../modules/vpc"
  aws_region   = var.aws_region
  project_name = var.project_name
  stage        = var.stage
}
