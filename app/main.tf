module "sg" {
  source = "../modules/sg"
}

module "eip" {
  source = "../modules/eip"
}

module "ebs" {
  source = "../modules/ebs"
  size   = 8
}

module "ec2-ebs-sg-eip" {
  source = "../modules/ec2"
  instance_type = "t2.medium"
  sg_name       = module.sg.out-sg-name
  ip            = "${module.eip.out-eip-ip}"
}

resource "aws_volume_attachment" "ebs_ec2_att" {
  device_name = "/dev/sdh"
  volume_id   = module.ebs.out-ebs-id
  instance_id = module.ec2-ebs-sg-eip.out-ec2-id
}

resource "aws_eip_association" "eip_ec2_assoc" {
  instance_id   = module.ec2-ebs-sg-eip.out-ec2-id
  allocation_id = module.eip.out-eip-id
}