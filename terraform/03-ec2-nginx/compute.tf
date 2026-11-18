resource "aws_instance" "nginx_instance" {
  ami                         = "ami-083cf4acad89c8905"
  associate_public_ip_address = true
  instance_type               = "t3.small"

  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]

  tags = merge(local.common_tags, {
    Name = "nginx_instance"
  })
}

resource "aws_security_group" "nginx_sg" {
  name        = "nginx_sg"
  description = "Allow HTTP and HTTPS traffic"
  vpc_id      = aws_vpc.nginx_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = "nginx_sg    "
  })
}