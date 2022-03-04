####################################################################
# Authors: Ahmad Aji Santoso
# Email: ahmad21@student.ub.ac.id
####################################################################

deploy:
	docker stack deploy --compose-file=mdl-stackfile.yml moodle

update:
	docker service scale moodle_moodle=3

rm:
	docker stack rm moodle

log:
	docker service logs $(id)
    
network:
	docker network create -d overlay traefik-proxy || true
	docker network create -d overlay database || true