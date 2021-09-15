variable "region" {
  type    = string
  default = "asia-east1"
  description = "Select region to deploy cloud run"
}

variable "path" {
  type    = string
  default = "/"
  description = "Enter git directory path"
}

