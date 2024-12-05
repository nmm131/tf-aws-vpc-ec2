// The resources for this service should go into an existing VPC/subnet
data "aws_vpc" "selected" {
  id = var.vpc_id
}

data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["yakdriver"]
  }
}

// Security groups should be created that allow the minimal required level of access between systems. The service should not be accessible over the internet
resource "aws_security_group" "sg" {
  name_prefix = "sg-"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = data.aws_vpc.selected.id

  tags = {
    Name = "allow_tls"
  }
}

// The application running on the instance listens on ports 443 and 7000-7010
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = [data.aws_subnet.selected.cidr_block]
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_ingress" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = [data.aws_subnet.selected.cidr_block]
  from_port         = 7000
  ip_protocol       = "tcp"
  to_port           = 7010
}

resource "aws_vpc_security_group_egress_rule" "allow_egress" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = [data.aws_subnet.selected.cidr_block]
  ip_protocol       = "-1"
}
