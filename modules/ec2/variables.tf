variable "instance_type" {
  default = "t2.small"
  type    = string
}

variable "key_SSH_name" {
  default = "michael-kp-ajc"
  type    = string
}

variable "sg_name" {
  default = "michael-sg-web"
  type    = string
}

variable "admin" {
  default = "michael"
  type    = string
}

variable "ip" {
  type    = string
  default = "NULL"
}