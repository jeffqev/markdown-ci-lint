override DOCKER_IMAGE = ghcr.io/igorshubovych/markdownlint-cli:latest
override FILES = *.md

prepare-lint:
	@if [ "$(with)" = "docker" ]; then\
		docker pull $(DOCKER_IMAGE);\
	else \
		npm install -g markdownlint-cli;\
	fi

lint:
	@if [ "$(with)" = "docker" ]; then\
		docker run -v "$(shell pwd):/workdir" $(DOCKER_IMAGE) $(FILES);\
	else \
		markdownlint -d $(FILES);\
	fi