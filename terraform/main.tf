# https://meet.google.com/eso-uqww-xbj
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Aws provider and access details
provider "aws" {
  access_key = "AKIAX7RWOTESXVH5CBUZ"               
  secret_key = "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"
  region = var.aws_region
}

resource "aws_instance" "manager" {
  ami = var.ami
  associate_public_ip_address = false
  instance_type = var.instance_t3a_medium
  key_name = var.key_name
  user_data = file(var.install_docker)
  vpc_security_group_ids = [aws_security_group.mdlswarm.id]

  tags = {
      Name  = "manager"
  }

   provisioner "remote-exec" {
    inline = [
      "sudo hostnamectl set-hostname manager"
      ]

    connection {
    type        = var.connection_type
    user        = var.connection_user
    private_key = file(var.key_path)
    host        = self.public_ip
    }
  }

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_type = "gp2"
    volume_size = var.ebs_vol

  tags = {
    Name = "MoodleManagerVolume"
    }
  }

}

resource "aws_instance" "worker1" {
  ami = var.ami
  associate_public_ip_address = false
  instance_type = var.instance_t3a_medium
  key_name = var.key_name
  user_data = file(var.install_docker)
  vpc_security_group_ids = [aws_security_group.mdlswarm.id]

  tags = {
    Name  = "worker1"
  }

   provisioner "remote-exec" {
    inline = [
      "sudo hostnamectl set-hostname worker-1"
      ]

    connection {
    type        = var.connection_type
    user        = var.connection_user
    private_key = file(var.key_path)
    host        = self.public_ip
    }

  }

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_type = "gp2"
    volume_size = var.ebs_vol

  tags = {
    Name = "MoodleWorker1Volume"
    }
  }

}

resource "aws_instance" "worker2" {
  ami = var.ami
  associate_public_ip_address = false
  instance_type = var.instance_t3a_medium
  key_name = var.key_name
  user_data = file(var.install_docker)
  vpc_security_group_ids = [aws_security_group.mdlswarm.id]

  tags = {
    Name  = "worker2"
  }

 provisioner "remote-exec" {
  inline = [
    "sudo hostnamectl set-hostname worker-2"
    ]

    connection {
    type        = var.connection_type
    user        = var.connection_user
    private_key = file(var.key_path)
    host        = self.public_ip
    }

  }

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_type = "gp2"
    volume_size = var.ebs_vol

  tags = {
    Name = "MoodleWorker2Volume"
    }
  }
}

resource "aws_instance" "worker3" {
  ami = var.ami
  associate_public_ip_address = false
  instance_type = var.instance_t3a_medium
  key_name = var.key_name
  user_data = file(var.install_docker)
  vpc_security_group_ids = [aws_security_group.mdlswarm.id]

  tags = {
    Name  = "worker3"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo hostnamectl set-hostname worker-3"
      ]
    
    connection {
    type        = var.connection_type
    user        = var.connection_user
    private_key = file(var.key_path)
    host        = self.public_ip
    }

  }

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_type = "gp2"
    volume_size = var.ebs_vol

  tags = {
    Name = "MoodleWorker3Volume"
    }
  }
}

resource "aws_instance" "worker4" {
  ami = var.ami
  associate_public_ip_address = false
  instance_type = var.instance_t3a_medium
  key_name = var.key_name
  user_data = file(var.install_docker)
  vpc_security_group_ids = [aws_security_group.mdlswarm.id]

  tags = {
    Name  = "worker4"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo hostnamectl set-hostname worker-4"
      ]

    connection {
    type        = var.connection_type
    user        = var.connection_user
    private_key = file(var.key_path)
    host        = self.public_ip
    }

  }

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_type = "gp2"
    volume_size = var.ebs_vol

  tags = {
    Name = "MoodleWorker4Volume"
    }
  }
}

resource "aws_instance" "sshfs" {
  ami = var.ami
  associate_public_ip_address = false
  instance_type = var.instance_t3a_medium
  key_name = var.key_name
  user_data = file(var.install_docker)
  vpc_security_group_ids = [aws_security_group.mdlswarm.id]

  tags = {
    Name  = "sshfs"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo hostnamectl set-hostname sshfs"
      ]

    connection {
    type        = var.connection_type
    user        = var.connection_user
    private_key = file(var.key_path)
    host        = self.public_ip
    }

  }

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_type = "gp2"
    volume_size = var.sshfs_vol

  tags = {
    Name = "sshfs"
    }
  }
}



