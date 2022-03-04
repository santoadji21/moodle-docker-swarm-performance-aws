###========== security-groups.tf ==========###

####################################################################
# Authors: Ahmad Aji Santoso
# Email: ahmad21@student.ub.ac.id
####################################################################

resource "aws_security_group" "mdlswarm" {
  name = "mdlswarm"
  tags = {
    name = "mdlswarm"
  }
  # Allow TCP WEB ACCESS
    ingress {
    description      = "TLS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # ============== SWARM PORT Inbound TCP ==================
  ingress {
    description      = "swarm + remote Manager"
    from_port        = 2377
    to_port          = 2377
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "swarm nodes"
    from_port        = 2375
    to_port          = 2375
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "TCP  Container Network Discovery"
    from_port        = 7946
    to_port          = 7946
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "TCP  Container Overlay Network"
    from_port        = 4789
    to_port          = 4789
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "VLAN"
    from_port        = 4097
    to_port          = 4097
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # ============== SWARM PORT Inbound UDP ==================
  ingress {
    description      = "swarm + remote Manager"
    from_port        = 2377
    to_port          = 2377
    protocol         = "udp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "swarm nodes"
    from_port        = 2375
    to_port          = 2375
    protocol         = "udp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "UDP  Container Overlay Network"
    from_port        = 4789
    to_port          = 4789
    protocol         = "udp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "VLAN"
    from_port        = 4097
    to_port          = 4097
    protocol         = "udp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "UDP  Container Network Discovery"
    from_port        = 7946
    to_port          = 7946
    protocol         = "udp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # Allow Custom Port
  ingress {
    description      = "ESP Overlay Network TCP"
    from_port        = 50
    to_port          = 50
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "ESP Overlay Network UDP"
    from_port        = 50
    to_port          = 50
    protocol         = "udp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # Allow all Outbound 
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # Enable ICMP
  ingress {
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
