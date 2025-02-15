resource "aws_route53_record" "expense" {
  count           = length(var.instance_name)
  zone_id         = var.zone_id
  name            = var.instance_name[count.index] == "frontend" ? var.domain_name : "${var.instance_name[count.index]}.${var.domain_name}" #intercollision
  type            = "A"
  ttl             = 1
  records         = var.instance_name[count.index] == "frontend" ? [aws_instance.terraform[count.index].public_ip] : [aws_instance.terraform[count.index].private_ip]
  allow_overwrite = true

}

# r53 we should get the output of ec2 instanced created.

#var.instance_name[count.index] == "frontend" ? var.domain_name : "$ {var.instance_name[count.index].$[var.domain_name]}

#var.instance_name[count.index] == "frontend" ? [aws.instance.terraform[count.index].public_ip] : [aws_instance_terraform[count.index].private.ip]