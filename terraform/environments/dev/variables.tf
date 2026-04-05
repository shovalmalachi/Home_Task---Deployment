variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "project_name" {
  type    = string
  default = "octopus"
}

variable "container_port" {
  type    = number
  default = 3000
}

variable "desired_count" {
  type    = number
  default = 1
}

variable "image_uri" {
  type = string
}

variable "mongo_uri" {
  type      = string
  sensitive = true
}

variable "db_name" {
  type    = string
  default = "octopusdb"
}

variable "collection_name" {
  type    = string
  default = "fruits"
}
