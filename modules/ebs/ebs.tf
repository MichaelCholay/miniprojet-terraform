resource "aws_ebs_volume" "ebs" {
  availability_zone = "us-east-1b"
  size              = var.size

  tags = {
    Name = "ebs-${var.admin}-terraform"
  }
}