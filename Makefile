format:
	autopep8 --in-place --aggressive --aggressive msg_def_overrides.py


check_format:
	./check_format.sh msg_def_overrides.py


docker_build:
	docker build --no-cache -t msg_def_overrides:latest -f Dockerfile .