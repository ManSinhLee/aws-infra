resource "aws_network_acl" "cmcloudlab_public_nacl" {
  vpc_id     = aws_vpc.cmcloudlab_vpc.id
  subnet_ids = aws_subnet.public_subnet.*.id
  ingress {
    rule_no    = 100
    action     = "allow"
    protocol   = "tcp"
    cidr_block = var.my_address
    from_port  = 22
    to_port    = 22
  }
  ingress {
    rule_no    = 101
    action     = "allow"
    protocol   = "tcp"
    cidr_block = var.office_address
    from_port  = 22
    to_port    = 22
  }
  ingress {
    rule_no    = 110
    action     = "allow"
    protocol   = "tcp"
    cidr_block = var.internet
    from_port  = 80
    to_port    = 80
  }
  ingress {
    rule_no    = 120
    action     = "allow"
    protocol   = "tcp"
    cidr_block = var.internet
    from_port  = 443
    to_port    = 443
  }
  ingress {
    rule_no    = 300
    protocol   = "tcp"
    action     = "allow"
    cidr_block = var.internet
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    rule_no    = 100
    protocol   = "all"
    action     = "allow"
    cidr_block = var.internet
    from_port  = 0
    to_port    = 0
  }

  egress {
    rule_no    = 300
    protocol   = "tcp"
    action     = "allow"
    cidr_block = var.internet
    from_port  = 1024
    to_port    = 65535
  }
  tags = {
    "Name" = "cmcloudlab_public_nacl"
  }
}

resource "aws_network_acl" "cmcloudlab_private_nacl" {
  vpc_id     = aws_vpc.cmcloudlab_vpc.id
  subnet_ids = aws_subnet.private_subnet.*.id
  ingress {
    rule_no    = 100
    action     = "allow"
    protocol   = "tcp"
    cidr_block = var.vpc_cidr_block
    from_port  = 22
    to_port    = 22
  }
  ingress {
    rule_no    = 110
    action     = "allow"
    protocol   = "tcp"
    cidr_block = var.internet
    from_port  = 80
    to_port    = 80
  }
  ingress {
    rule_no    = 120
    action     = "allow"
    protocol   = "tcp"
    cidr_block = var.internet
    from_port  = 443
    to_port    = 443
  }
  ingress {
    rule_no    = 300
    protocol   = "tcp"
    action     = "allow"
    cidr_block = var.internet
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    rule_no    = 100
    protocol   = "all"
    action     = "allow"
    cidr_block = var.internet
    from_port  = 0
    to_port    = 0
  }

  egress {
    rule_no    = 300
    protocol   = "tcp"
    action     = "allow"
    cidr_block = var.internet
    from_port  = 1024
    to_port    = 65535
  }
  tags = {
    "Name" = "cmcloudlab_private_nacl"
  }
}

resource "aws_network_acl" "cmcloudlab_database_nacl" {
  vpc_id     = aws_vpc.cmcloudlab_vpc.id
  subnet_ids = aws_subnet.database_subnet.*.id
  ingress {
    rule_no    = 100
    action     = "allow"
    protocol   = "tcp"
    cidr_block = var.vpc_cidr_block
    from_port  = 3306
    to_port    = 3306
  }
  ingress {
    rule_no    = 110
    action     = "allow"
    protocol   = "tcp"
    cidr_block = var.vpc_cidr_block
    from_port  = 5432
    to_port    = 5432
  }

  ingress {
    rule_no    = 300
    protocol   = "tcp"
    action     = "allow"
    cidr_block = var.internet
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    rule_no    = 100
    protocol   = "all"
    action     = "allow"
    cidr_block = var.internet
    from_port  = 0
    to_port    = 0
  }
  egress {
    rule_no    = 300
    protocol   = "tcp"
    action     = "allow"
    cidr_block = var.internet
    from_port  = 1024
    to_port    = 65535
  }
  tags = {
    "Name" = "cmcloudlab_database_nacl"
  }
}