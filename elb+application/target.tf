resource "aws_lb_target_group" "test" {
  name     = "TG-1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

