-include .env
export $(shell test -f .env && cut -d= -f1 .env)

DATA_URL = https://data.alterloop.dev/api

push:
	@git add .
	@git commit -am "Daily update" || true
	@git push

test-list:
	@curl -L \
		-H Secret:$(DATA_SECRET) \
		"$(DATA_URL)/list?sheet=2025"

test-insert:
	@curl -L \
		-H Secret:$(DATA_SECRET) \
		 "$(DATA_URL)/insert" -d '{"sheet":"Test CIAO", "name":"Frank", "age":10, "city":{"name":"Rome","cap":10000}}'
