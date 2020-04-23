data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_vpc" "selected" {
  filter {
    name   = "tag:AWS_Solutions"
    values = ["LandingZoneStackSet"]
  }
}

data "aws_subnet_ids" "public" {
  vpc_id = data.aws_vpc.selected.id
  filter {
    name   = "tag:Name"
    values = ["Public Subnet*"]
  }
}

resource "aws_security_group" "Chef_Server_Security_Group" {
  vpc_id      = data.aws_vpc.selected.id
  name        = "Chef_Server_Security_Group"
  description = "Allow traffic on port 443, 80, 22, all outbound"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8443
    to_port     = 8443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ChefServerInstance" {
  ami                    = local.ami_ids[var.platform]
  instance_type          = var.instance_type == "t3.medium" && var.platform == "rhel-6" ? "t2.medium" : var.instance_type
  vpc_security_group_ids = ["${aws_security_group.Chef_Server_Security_Group.id}"]
  /*iam_instance_profile   = aws_iam_instance_profile.nginx.id*/
  subnet_id              = tolist(data.aws_subnet_ids.public.ids)[0]
  key_name               = var.key_name
  user_data              = templatefile("${path.module}/cloudinit_conf.tpl", { workspaces = "workspaces" })
  tags = merge(
    var.hcs_mandatory_tags,
    {
      "Name" = "CHEF-SERVER"
    }
  )
  volume_tags = merge(
    var.hcs_mandatory_tags,
    {
      "Name" = "CHEF-SERVER"
    }
  )
}
