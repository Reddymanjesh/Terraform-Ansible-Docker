resource "aws_key_pair" "default" {
  key_name   = "Workstation"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDNwtta+f/vxKeXLyB8Y+O3VgkDLb8DFKSRGAtCDIAKzJcEIMorQuBc5gqejvCcCxmRyIj9TlzLytRtnvE6bjDbfJBewA2bRe9XY2zCHZA77HOewuTIeezndh0q9uSsyoEsK5xxM/K60WW/0aqVRUnm2ontO5zOz5zt2mM4ejbxotzOub0SwTzH5+bz49SOeZbQerFEbmhaiwxJlWQz56sWoHG8wbrkZlZebzwTZU4q1mR8xxCukm0lIQOL+aig8lNJvmy29T9/dVX+BkOL79Mo/qKfQ2nv3Yskvw+g7uc4oyyQeRuXMYyrr7W83Du0IWY7DlNpO6gBLUi2Q7Rbzvtheqh7m7lVsVgGptNe0vOoC6d3nYQtWdndribLxlP5r8YVi2IosnuIDnTGgHebStGOPcnZukJDViiUf24Xpd5puti8aUsPvfIlVI+8O8uyqdNr8ci6jZ51jLy/HxsohNmLH+PmBR2VV3eb/tKaet+siR0l2TUoKcgxCRaQopPFIbidUcD51Xa7kTQc0vh7NAH6EYazEEgSJNTdwY3ICwgAtyUS9BV3xiEtqIVkCb0f9u0B2SAtpX8DXtSl6V2eudQzGrSFfOTWeF2GCp9KQ+ddscuF9pIO+tOgVUsg5bRu1U3t3jMQp5RnMrNXTWViz+5IfGZNK64UPnJ9xVmu5D35Lw== Workstation"
}

resource "aws_instance" "master" {
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  key_name               = "${aws_key_pair.default.id}"
  user_data              = "${file("${var.bootstrap_path}")}"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]

  tags {
    Name = "master"
  }
}

resource "aws_instance" "worker1" {
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  key_name               = "${aws_key_pair.default.id}"
  user_data              = "${file("${var.bootstrap_path}")}"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]

  tags {
    Name = "worker 1"
  }
}

resource "aws_instance" "worker2" {
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  key_name               = "${aws_key_pair.default.id}"
  user_data              = "${file("${var.bootstrap_path}")}"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]

  tags {
    Name = "worker 2"
  }
}
