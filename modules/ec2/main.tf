// The service itself runs on Windows and should run on a Windows EC2 instance
resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = "t3.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.vpc_security_group_ids]

  // The instance needs to take a user data powershell scrip that will perform some setup task (you do not need to write the powershell script, but there should be a placeholder for the full script)
  user_data = <<-EOF
    # placeholder for setup task
    EOF

  tags = {
    Name = "main"
  }
}
