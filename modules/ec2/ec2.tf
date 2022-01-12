data "aws_ami" "ubuntu_bionic_ami" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "ec2" {
  ami             = data.aws_ami.ubuntu_bionic_ami.id
  key_name        = var.key_SSH_name
  instance_type   = var.instance_type
  security_groups = ["${var.sg_name}"]
  tags = {
    Name = "ec2-${var.admin}-terraform"
    iac  = "terraform"
  }

  provisioner "local-exec" {
    command = "echo PUBLIC IP: ${var.ip} >> ip_ec2.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt -y install nginx",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("D:/AJC - UMANIS/AJC/17-Terraform/TP/.aws/michael-kp-ajc.pem")
    host        = self.public_ip
  }
}