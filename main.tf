resource "aws_security_group" "main" {
  name        = var.sg_name # catalogue
  description = var.sg_description
  vpc_id      = var.vpc_id

# we are not added ingress bcz we need to add diff ports
# egress is common for all sg
# egress traffic is instace traffic

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = merge(
    var.sg_tags,
    local.common_tags,
    {
        Name = "${local.common_name_suffix}-${var.sg_name}" # roboshop-dev-catalogue
    }
  )
}


# tested in Repo roboshop-dev-infra
# this is custom module