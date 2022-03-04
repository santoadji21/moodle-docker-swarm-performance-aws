####################################################################
# Authors: Ahmad Aji Santoso
# Email: ahmad21@student.ub.ac.id
####################################################################

init: 
	terraform init

plan:
	terraform plan

apply:
	terraform apply -auto-approve
	
destroy:
	terraform destroy -auto-approve

play:
	sudo ansible-playbook -i inventory/hosts playbook.yml

hostname:
	sudo ansible-playbook -i inventory/hosts addhostname/playbook.yml
	
pluginset:
	sudo ansible-playbook -i inventory/hosts sshfsconfig/playbook.yml

deploymoodle:
	sudo ansible-playbook -i inventory/hosts deploy/playbook.yml

copy:
	sudo ansible-playbook -i inventory/hosts course/playbook.yml

cwagent:
	sudo ansible-playbook -i inventory/hosts cloudwatch/playbook.yml

leave:
	sudo ansible-playbook -i inventory/hosts swarmleave/playbook.yml

