// Security groups should be created that allow the minimal required level of access between systems. The service should not be accessible over the internet
resource "aws_security_group" "allow_tls" {
  name_prefix = "sg-"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "allow_tls"
  }
}

// The application running on the instance listens on ports 443 and 7000-7010
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 7000
  ip_protocol       = "tcp"
  to_port           = 7919
}

resource "aws_vpc_security_group_egress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  # from_port         = 0
  ip_protocol = "-1"
  # to_port           = 0
}

// The service itself runs on Windows and should run on a Windows EC2 instance
resource "aws_instance" "web" {
  ami             = var.ami_id
  instance_type   = "t3.micro"
  subnet_id       = var.subnet_id
  security_groups = var.security_group_id

  // The instance needs to take a user data powershell scrip that will perform some setup task (you do not need to write the powershell script, but there should be a placeholder for the full script)
  user_data = <<-EOF
    #!powershell
    # placeholder for setup task
    EOF

  tags = {
    Name = "main"
  }
}

// There should be an RDS instance that will be used for the DB backend (use MSSQL Server)
resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}
// The application should be behind an Application Load Balancer with appropriate ports exposed
resource "aws_lb" "test" {
  name_prefix        = "lb-"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = var.subnets

  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.lb_logs.id
    prefix  = "test-lb"
    enabled = true
  }

  tags = {
    Environment = "production"
  }
}

// There should be a VPC endpoint service created to expose this service to client s- all application ports need to be exposed over the endpoint
resource "aws_vpc_endpoint_service" "example" {
  acceptance_required        = false
  network_load_balancer_arns = [aws_lb.example.arn]
}
