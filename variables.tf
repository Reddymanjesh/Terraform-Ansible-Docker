variable "aws_region" {
  description = "AWS region on which we will setup the swarm cluster"
  default     = "us-east-1"
}

variable "ami" {
  description = "Ubuntu"
  default     = "ami-0ac019f4fcb7cb7e6"
}

variable "instance_type" {
  description = "Instance type"
  default     = "t2.micro"
}

variable "bootstrap_path" {
  description = "Script to install Docker Engine"
  default     = "install-docker.sh"
}
