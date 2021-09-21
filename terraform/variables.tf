variable "region" {
  type    = string
  default = "asia-east1"
  description = "Select region to deploy cloud run"
}

variable "imagesha" {
  type    = string
  default = ""
  description = "Enter latest docker image SHA"
}

variable "gw_region" {
  type    = string
  default = "asia-northeast1"
  description = "Select region to deploy cloud run"
}


