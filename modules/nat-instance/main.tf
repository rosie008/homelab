
resource "aws_instance" "nat-instance" {
  ami           = var.ami_id
  instance_type = "${var.instance_type}"

  iam_instance_profile        = var.iam_instance_profile
  vpc_security_group_ids      = [var.security_group_id]
  subnet_id                   = var.subnet_id
  user_data_base64            = base64encode(file("./modules/nat-instance/user_data.sh"))
  associate_public_ip_address = true

  source_dest_check = false

  tags = {
    Name = "${var.project_name}-nat-instance"
  }
}