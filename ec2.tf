resource "aws_instance" "instance_type" {
  ami                         = "ami-05fa00d4c63e32376"
  instance_type               = var.instance_type
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  subnet_id                   = aws_subnet.subnet1-public.id
  associate_public_ip_address = true
  availability_zone           = var.azs
  user_data                   = file("docker.sh")
  key_name                    = var.key_name
  tags = {
    Name = "Deployed instance"
  }
}
