output "nginx_info" {
  description = "this is information from nginx-server"
  value = "http://${aws_instance.nginx.public_ip}:80"
}