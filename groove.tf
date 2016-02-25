resource "aws_instance" "groove" {
  instance_type = "t2.micro"
  ami = "${lookup(var.aws_amis, var.aws_region)}"
  key_name = "${var.key_name}"
  security_groups = ["${aws_security_group.groove.name}"]
  tags {
    Name = "groove_${count.index}"
    Index = "${count.index}"
    Group = "groove"
    DNS = "groove${count.index}.neoxia-labs.com"
  }
  count = "${var.groove_count}"
}

resource "aws_route53_record" "groove" {
   zone_id = "Z3P1E0U6CTTKSW"
   name = "groove${count.index}.neoxia-labs.com"
   type = "A"
   ttl = "300"
   records = ["${element(aws_instance.groove.*.public_ip, count.index)}"]
   count = "${var.groove_count}"
}

