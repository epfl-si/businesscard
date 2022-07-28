initdb/3-accred-mock-data.sql: /keybase/team/epfl_bsnscrd/initdb/3-accred.sql
	cat $< > $@

.PHONY: up
up: initdb/3-accred-mock-data.sql
	$(MAKE) initdb
	docker-compose up -d --build

.PHONY: down
down:
	docker-compose down

rinse:
	$(MAKE) down
	rm initdb/3-accred-mock-data.sql
	docker volume prune
