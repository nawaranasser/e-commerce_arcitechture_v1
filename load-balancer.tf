resource "aws_lb" "e-commerce-alb" {
  name               = "e-commerce-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]
  subnets            = [aws_subnet.public_subnet-1.id, 
                        aws_subnet.public_subnet-2.id]


  tags = {
    Environment = "test"
    Name        = "e-commerce-lb-tf"
  }
}

##target group
resource "aws_lb_target_group" "e-commerce-tg" {
  name     = "e-commerce-lb-tg"
  port     = 80
  protocol = "HTTP"

  target_type         = "instance"
  vpc_id   = aws_vpc.e-commerce_vpc.id
}


##listener
resource "aws_lb_listener" "e-commerce-listener" {
  load_balancer_arn = aws_lb.e-commerce-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.e-commerce-tg.arn
  }
}

###target group attachment

resource "aws_lb_target_group_attachment" "e-commerce-tg-attachment-1" {
  target_group_arn = aws_lb_target_group.e-commerce-tg.arn
  target_id        = aws_instance.e-commerce_instance-1.id
  port             = 80
}


resource "aws_lb_target_group_attachment" "e-commerce-tg-attachment-2" {
  target_group_arn = aws_lb_target_group.e-commerce-tg.arn
  target_id        = aws_instance.e-commerce_instance-2.id
  port             = 80
}