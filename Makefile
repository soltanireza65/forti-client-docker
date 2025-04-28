up:
	docker compose up --build

down:
	docker compose down

logs:
	docker compose logs -f

ssh-proxy:
	ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ExitOnForwardFailure=yes -N -D 1080 -p 2222 root@localhost