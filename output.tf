output "dns_publica" {
  value = "http://${aws_instance.ECERT_instance.public_dns}"
}
output "IP_publica" {
  description = "Direccion IP publica de la Instancia EC2"
  value       = "http://${aws_instance.ECERT_instance.public_ip}"
}
output "SSH_Connect" {
  description = "para conectarse a la instancia"
  value       = "ssh  -X centos@${aws_instance.ECERT_instance.public_ip}"
}
