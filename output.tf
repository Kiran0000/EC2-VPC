output "myvpc" {
  value = aws_vpc.main.arn
}
output "vpc_arn" {
  value = aws_vpc.main.arn
}
output "vpc_id" {
  value = aws_vpc.main.id
}
output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}
output "sg_id" {
  value = aws_security_group.allow_ssh.id
}
output "sg_arn" {
  value = aws_security_group.allow_ssh.arn
}
output "sg_in" {
  value = aws_security_group.allow_ssh.ingress
}
output "ec2_id" {
  value = aws_instance.main_ec2.id
}
output "ec2_arn" {
  value = aws_instance.main_ec2.arn
}
output "ec2_az" {
  value = aws_instance.main_ec2.availability_zone
}
output "ec2_dns" {
  value = aws_instance.main_ec2.associate_public_ip_address
}
