resource "aws_route53_record" "expense" {
  count   = length(var.instance_names)
  zone_id = var.zone_id
  name    = "${var.instance_names[count.index]}.${var.domain_name}" # "$" this consider variables 
  type    = "A"
  ttl     = 1
  records = [output.instance.info[count.index].private_ip]
}