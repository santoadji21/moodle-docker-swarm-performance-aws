###==========  output.tf ==========###

####################################################################
# Authors: Ahmad Aji Santoso
# Email: ahmad21@student.ub.ac.id
####################################################################

output "manager_private_ip" {
  value = [aws_instance.manager.private_ip]
}

output "sshfs_private_ip" {
  value = [aws_instance.sshfs.private_ip]
}

output "manager_public_ip" {
  value = [aws_instance.manager.public_ip]
}

output "worker1_public_ip" {
  value = [aws_instance.worker1.public_ip]
}

output "worker2_public_ip" {
  value = [aws_instance.worker2.public_ip]
}

output "worker3_public_ip" {
  value = [aws_instance.worker3.public_ip]
}

output "worker4_public_ip" {
  value = [aws_instance.worker4.public_ip]
}

output "sshfs_public_ip" {
  value = [aws_instance.sshfs.public_ip]
}


# Generate Hosts Inventory
resource "local_file" "AnsibleHosts" {
    filename = "./inventory/hosts"
    content = templatefile("hosts.tmpl",
        {
            manager = aws_instance.manager.public_ip,
            worker1 = aws_instance.worker1.public_ip,
            worker2 = aws_instance.worker2.public_ip,
            worker3 = aws_instance.worker3.public_ip,
            worker4 = aws_instance.worker4.public_ip,
            sshfs   = aws_instance.sshfs.public_ip,
            manager_private_ip = aws_instance.manager.private_ip,
            sshfs_private_ip   = aws_instance.sshfs.private_ip,
        }
    )
}

# Generate Stackfile
resource "local_file" "Stackfile" {
    filename = "./stackfile/mdl-stackfile.yml"
    content = templatefile("stackfile.tmpl",
        {
            sshfs_private_ip = aws_instance.sshfs.private_ip,
            manager = aws_instance.manager.public_ip,
        }
    )
}
