###==========  variable.tf ==========###

####################################################################
# Authors: Ahmad Aji Santoso
# Email: ahmad21@student.ub.ac.id
####################################################################

variable "aws_region" {
  description = "AWS region on which we will setup the swarm cluster"
  default = "ap-southeast-1"
}

variable "ami" {
  description = "Ubuntu Server 16.04 LTS (HVM), SSD Volume Type (x86)"
  default = "ami-0f9d733050c9f5365"
}

variable "instance_t2_medium" {
  description = "Instance type"
  default = "t2.medium"
}

variable "instance_t3_medium" {
  description = "Instance type"
  default = "t3.medium"
}

variable "instance_t3a_medium" {
  description = "Instance type"
  default = "t3a.medium"
}


variable "key_path" {
  description = "SSH Public Key path"
  default = "/vagrant/aws-terraform-swarm/moodle-singapore.pem"
}

variable "key_name" {
  description = "Desired name of Keypair..."
  default = "moodle-singapore"
}

variable "install_docker" {
  description = "Script to install Docker Engine"
  default = "install-docker.sh"
}

variable "connection_type" {
  description = "Connection For Remote Exec provisioner"
  default = "ssh"
}
variable "connection_user" {
  description = "User For Connection Remote Exec provisioner"
  default = "ubuntu"
}

variable "ebs_vol"{
  description = "EBS volume_size"
  default = 25
}

variable "sshfs_vol"{
  description = "EBS SSHFS volume_size"
  default = 25
}