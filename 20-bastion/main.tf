resource "aws_instance" "bastion" {
  ami           = local.ami_id 
  #  "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.bastion_sg_id]
  tags = merge(
    local.common_tags,
    {
     name = "${var.project_name}-${var.environment}-baston"
    }
    
  )

}