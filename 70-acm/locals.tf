locals {
  common_name_suffix = "${var.project_name}-${var.environment}" #roboshop-dev
  # ami_id            = data.aws_ami.joindevops.id
  # vpc_id            = data.aws_ssm_parameter.vpc_id.value

  common_tags = {
    project     = var.project_name
    environment = var.environment
    terraform   = true
  }
}
