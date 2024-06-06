resource "aws_key_pair" "private" {
  key_name   = "my_id_rsa.pub"
  public_key = file(var.public_key_path)
  tags = {
    CreatedBy = "terraform"
  }

}