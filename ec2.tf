resource "aws_instance" "instance_type" {
  ami                         = "ami-05fa00d4c63e32376"
  instance_type               = var.instance_type
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  subnet_id                   = aws_subnet.subnet1-public.id
  associate_public_ip_address = true
  availability_zone           = var.azs
  #user_data                   = file("docker.sh")
  user_data                   = "${file("jenkins.sh")}"
  key_name                    = var.key_name
  tags = {
    Name = "jenkins-master"
  }
}

resource "aws_eip" "lb" {
  instance = aws_instance.instance_type.id
  vpc      = true
}

resource "aws_instance" "instance_type1" {
  ami                         = "ami-05fa00d4c63e32376"
  instance_type               = "t2.xlarge"
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  subnet_id                   = aws_subnet.subnet1-public.id
  associate_public_ip_address = true
  availability_zone           = var.azs
  user_data                   = file("docker.sh")
  #user_data                   = "${file("jenkins.sh")}"
  key_name                    = var.key_name
  tags = {
    Name = "stagging"
  }
}

resource "aws_instance" "instance_type2" {
  ami                         = "ami-05fa00d4c63e32376"
  instance_type               = var.instance_type
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  subnet_id                   = aws_subnet.subnet1-public.id
  associate_public_ip_address = true
  availability_zone           = var.azs
  #user_data                   = file("docker.sh")
  #user_data                   = "${file("jenkins.sh")}"
  key_name                    = var.key_name
  tags = {
    Name = "kubernetes-master"
  }
}
resource "aws_instance" "instance_type3" {
  ami                         = "ami-05fa00d4c63e32376"
  instance_type               = var.instance_type
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  subnet_id                   = aws_subnet.subnet1-public.id
  associate_public_ip_address = true
  availability_zone           = var.azs
  #user_data                   = file("docker.sh")
  #user_data                   = "${file("jenkins.sh")}"
  key_name                    = var.key_name
  tags = {
    Name = "k8s-worker-node"
  }
}
