initdb/3-accred-mock-data.sql: /keybase/team/epfl_bsnscrd/initdb/3-accred.sql
	cat $< > $@

.PHONY: up-domq
up-domq: initdb/3-accred-mock-data.sql
	$(MAKE) initdb
	docker-compose up --build

.PHONY: up
up:
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
	docker volume prune -f
	# rm conf/docker/initdb/3-accred-mock-data.sql

.PHONY: stop
stop:
	docker stop $$(docker ps -aq --filter "name=business*")

.PHONY: rm
rm:
	docker rm $$(docker ps -aq --filter "name=business*")

.PHONY: exec
exec:
	docker exec --env MAIL_SF=jerome.cosandey@epfl.ch --env SASL_USERNAME=noreply-businesscard --env SASL_PASSWORD=$$(grep -A3 'service: ' /keybase/team/epfl_bsnscrd/service.yml | tail -n1 | cut -c 11-) -it $$(docker ps -a --filter "name=businesscard_web" --format "{{.Names}}") bash

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


