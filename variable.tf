variable "main_vpc" {
  type    = string
  default = "10.0.0.0/16"
}
variable "login_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC6KGhN8HT1kryXYb3NTzxF1W4wLnZOlj3Nn3Fpew+ZAEIL9by+RYAG9Ug8RJjFUX9vol5YH9LrMgQY/6q+9r+yvp8AhupcQUfwNEyYf3zPba9piODat35PCon2DdDxzI7pe6xs3wEVGkQSz8nP8bdmZQUXbAjn4ce1I6o1mPjLM6j9NihDCQdhuAZz3sOAowcju0vkFKjs0CnwMet1V9NFdngIIEowO5YQB/aCwHGkM+zyKVp/+i5IY6JlALFYhCAxVTSGx3ZXdH12OxF2bkDTu0epslLOtLYwBJz6Z5GR4fM6aDjOahKagkLy3xQhOQAI3oR2b8tkKHeiqnWZTCOj cloud_user@c1baee510c1c.mylabserver.com"
}
variable "main_sub" {
  type    = string
  default = "us-east-1a"
}
variable "main_type" {
  type    = string
  default = "t2.micro"
}
variable "main_ami" {
  type    = string
  default = "ami-0947d2ba12ee1ff75"
}
