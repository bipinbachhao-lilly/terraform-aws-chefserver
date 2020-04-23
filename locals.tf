locals {
  ami_ids = {
    rhel-7       = data.aws_ami.rhel_7.id
    rhel-8       = data.aws_ami.rhel_8.id
    "ubuntu-16.04" = data.aws_ami.ubuntu_1604.id
    "ubuntu-18.04" = data.aws_ami.ubuntu_1804.id
  }
}
