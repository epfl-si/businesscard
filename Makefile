initdb/3-accred-mock-data.sql: /keybase/team/epfl_bsnscrd/initdb/3-accred.sql
	cat $< > $@

.PHONY: up
up: initdb/3-accred-mock-data.sql
	$(MAKE) initdb
	docker-compose up --build

.PHONY: up-d
up-d: initdb/3-accred-mock-data.sql
	$(MAKE) initdb
	docker-compose up --build -d

.PHONY: down
down:
	docker-compose down

rinse:
	$(MAKE) down
	docker volume prune
	rm conf/docker/initdb/3-accred-mock-data.sql

.PHONY: stop
stop:
	docker stop $$(docker ps -aq --filter "name=business*")

.PHONY: rm
rm:
	docker rm $$(docker ps -aq --filter "name=business*")

.PHONY: exec
exec:
	docker exec -it $$(docker ps -a --filter "name=businesscard_web" --format "{{.Names}}") bash

	.PHONY: build
build:
	docker build . -t businesscard-test/businesscard
	
.PHONY: tag
tag:
	docker tag businesscard-test/businesscard os-docker-registry.epfl.ch/businesscard-test/businesscard:develop

.PHONY: push
push:
	docker push os-docker-registry.epfl.ch/businesscard-test/businesscard:develop

.PHONY: run
run:
	docker run -it businesscard-test/businesscard bash


