variable "region" {
  type    = string
  default = ""
  description = "Select region to deploy cloud run"
}

variable "project" {
  type    = string
  default = ""
  description = "Select project to deploy cloud run"
}

variable "imagesha" {
  type    = string
  default = ""
  description = "Enter latest docker image SHA"
}

