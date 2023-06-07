resource "aws_security_group" "alb_sg" {
  name   = "cmcloudlab_alb_sg"
  vpc_id = aws_vpc.cmcloudlab_vpc.id
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.internet]
    ipv6_cidr_blocks = [var.internet_v6]
    description      = "allow HTTP traffic from internet"
  }
  # ingress {
  #   from_port        = 443
  #   to_port          = 443
  #   protocol         = "tcp"
  #   cidr_blocks      = [var.internet]
  #   ipv6_cidr_blocks = [var.internet_v6]
  #   description      = "allow HTTPs traffic from internet"
  # }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.internet]
    ipv6_cidr_blocks = [var.internet_v6]
    description      = "allow all traffic outbound"
  }
}

resource "aws_security_group" "public_sg" {
  name   = "public_sg"
  vpc_id = aws_vpc.cmcloudlab_vpc.id
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.my_address, var.office_address]
    ipv6_cidr_blocks = [var.internet_v6]
    description      = "allow SSH from my ip address"
  }
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.internet]
    ipv6_cidr_blocks = [var.internet_v6]
    description      = "allow HTTP traffic from internet"
  }
  # ingress {
  #   from_port        = 443
  #   to_port          = 443
  #   protocol         = "tcp"
  #   cidr_blocks      = [var.internet]
  #   ipv6_cidr_blocks = [var.internet_v6]
  #   description      = "allow HTTPs traffic from internet"
  # }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.internet]
    ipv6_cidr_blocks = [var.internet_v6]
    description      = "allow all traffic outbound"
  }
}

resource "aws_security_group" "private_sg" {
  name   = "private_sg"
  vpc_id = aws_vpc.cmcloudlab_vpc.id
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr_block]
    ipv6_cidr_blocks = [var.internet_v6]
    description      = "allow SSH from vpc"
  }
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.internet]
    ipv6_cidr_blocks = [var.internet_v6]
    description      = "allow HTTP traffic from internet"
  }
  # ingress {
  #   from_port        = 443
  #   to_port          = 443
  #   protocol         = "tcp"
  #   cidr_blocks      = [var.internet]
  #   ipv6_cidr_blocks = [var.internet_v6]
  #   description      = "allow HTTPs traffic from internet"
  # }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.internet]
    ipv6_cidr_blocks = [var.internet_v6]
    description      = "allow all traffic outbound"
  }
}

resource "aws_security_group" "database_sg" {
  name   = "database_sg"
  vpc_id = aws_vpc.cmcloudlab_vpc.id
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr_block]
    description = "allow traffic inside vpc"
  }

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr_block]
    description = "allow traffic inside vpc"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_cidr_block]
    description = "allow all traffic outbound"
  }
}