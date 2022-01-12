resource "aws_eip" "eip" {
  vpc = true
  tags = {
    Name = "eip-${var.admin}-terraform"
  }
}
