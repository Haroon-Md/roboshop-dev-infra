resource "aws_instance" "bastion" {
  ami = local.ami_id
  #  "ami-0220d79f3f480ecf5"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [local.bastion_sg_id]
  subnet_id              = local.public_subnet_ids
  iam_instance_profile = aws_iam_instance_profile.bastion.name
  user_data = file("bastion.sh")
  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-bastion"
    }

  )

}

resource "aws_iam_instance_profile" "bastion" {
  name = "bastion"
  role = "BastionTerraformAdmin"
}

