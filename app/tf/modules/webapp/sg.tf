resource "aws_security_group" "zurich_webapp_sg" {
 name        = "webapp_ssh_sg"
 description = "sg for webapp."
 vpc_id      = var.vpc_id
}
resource "aws_security_group_rule" "allow_egress_all" {
 type              = "egress"
 description       = "allow all egress."
 from_port         = 0
 to_port           = 0
 protocol          = "-1"
 cidr_blocks       = ["0.0.0.0/0"]
 security_group_id = aws_security_group.zurich_webapp_sg.id
}
resource "aws_security_group_rule" "allow_ssh" {
 type              = "ingress"
 description       = "ssh ingress"
 from_port         = 22
 to_port           = 22
 protocol          = "tcp"
 cidr_blocks       = ["0.0.0.0/0"]
 security_group_id = aws_security_group.zurich_webapp_sg.id
}

resource "aws_security_group_rule" "allow_https" {
 type              = "ingress"
 description       = "HTTPS ingress"
 from_port         = 443
 to_port           = 443
 protocol          = "tcp"
 cidr_blocks       = ["0.0.0.0/0"]
 security_group_id = aws_security_group.zurich_webapp_sg.id
}

resource "aws_security_group_rule" "allow_leet" {
 type              = "ingress"
 description       = "1337 ingress"
 from_port         = 1337
 to_port           = 1337
 protocol          = "tcp"
 cidr_blocks       = ["0.0.0.0/0"]
 security_group_id = aws_security_group.zurich_webapp_sg.id
}
resource "aws_security_group_rule" "allow_sth_tcp" {
 type              = "ingress"
 description       = "3035  ingress"
 from_port         = 3035 
 to_port           = 3035 
 protocol          = "tcp"
 cidr_blocks       = ["0.0.0.0/0"]
 security_group_id = aws_security_group.zurich_webapp_sg.id
}

resource "aws_security_group_rule" "allow_sth_udp" {
 type              = "ingress"
 description       = "3035  ingress"
 from_port         = 3035 
 to_port           = 3035 
 protocol          = "udp"
 cidr_blocks       = ["0.0.0.0/0"]
 security_group_id = aws_security_group.zurich_webapp_sg.id
}
