resource "aws_lb" "my_lb" {
  name               = "app-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_1.id]
  subnets            = [aws_subnet.sub_1.id , aws_subnet.sub_2.id]

  enable_deletion_protection = false

  tags = {
    name= "production"
  }
}


