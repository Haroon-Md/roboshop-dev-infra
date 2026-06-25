resource "aws_lb" "backend_alb" {
  name               = "${local.common_name_suffix}-backend-alb" #roboshop-dev-backend-alb
  internal           = true
  load_balancer_type = "application"
  security_groups    = [local.backend_alb_sg_id]
  subnets            = local.private_subnet_ids

  enable_deletion_protection = true #prevents accidental deletion from UI


  # access_logs {
  # bucket = 
  # prefix = 
  # enabled = 

  tags = merge(
    local.common_tags,
    {
      Name = "${local.common_name_suffix}-backend-alb"
    }

  )

}

#backend ALB listening on port number 80
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.backend_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"


    fixed_response {
      content_type = "text/plain"
      message_body = "Hi,im backend from alb HTTP"
      status_code  = "200"
    }
  }

}

  #THE TARGET GROUP OR TARGET TEAM IS NOT YET CREATED SO WE ARE USING FIXED RESPONSE FOR TESTING PURPOSE 
  # default_action {
  #     type = "redirect"

  #     redirect {
  #         port = "443"
  #         protocol = "HTTPS"
  #         status_code = "HTTP_301"
  #     }
  # }
