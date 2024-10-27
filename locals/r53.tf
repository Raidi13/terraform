resource "aws_route53_record" "expense" {
  count           = length(var.instance_name)
  zone_id         = local.zone_id
  name            = var.instance_name[count.index] == "frontend" ? local.domain_name : "${var.instance_name[count.index]}.${local.domain_name}"
  type            = "A"
  ttl             = 1
  records         = var.instance_name[count.index] == "frontend" ? [aws_instance.terraform[count.index].public_ip] : [aws_instance.terraform[count.index].private_ip]
  allow_overwrite = true

}

