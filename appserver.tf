resource "aws_key_pair" "private" {
  key_name   = "my_id_rsa.pub"
  public_key = file(var.public_key_path)
  tags = {
    CreatedBy = "terraform"
  }

}

data "aws_subnet" "app" {

  filter {
    name   = "tag:Name"
    values = [var.app_subnet_name] # insert values here
  }
  depends_on = [
    aws_subnet.subnet1
  ]
}




resource "aws_instance" "appserver" {
  ami                         = var.ubuntu_ami_id
  associate_public_ip_address = true
  instance_type               = var.app_instance_size
  key_name                    = aws_key_pair.private.key_name
  vpc_security_group_ids      = [aws_security_group.appsg.id]
  subnet_id                   = data.aws_subnet.app.id

  tags = {
    Name = "ntier-ec2"
  }

  depends_on = [
    aws_subnet.subnet1 #Here we must have written database depends on also but we didnt write for now as we commented it
  ]
}