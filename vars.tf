variable "AWS_REGION" {
  default = "eu-west-3"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "~/.ssh/id_rsa"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "~/.ssh/id_rsa.pub"
}
variable "AMIS" {
  type = "map"
  default = {
    eu-west-3 = "ami-e24dfa9f"
    eu-west-2 = "ami-42415826"
    eu-west-1 = "ami-94b236ed"
  }
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

