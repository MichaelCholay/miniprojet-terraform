output "out-eip-ip" {
  value = aws_eip.eip.public_ip
}

output "out-eip-id" {
  value = aws_eip.eip.id
}