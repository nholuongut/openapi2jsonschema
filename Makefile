#!/usr/bin/make -f

.PHONY: docker-image
docker-image:
	docker build -f Dockerfile -t nholuongut/openapi2jsonschema .

publish: docker-image
	docker tag nholuongut/openapi2jsonschema docker.pkg.github.com/nholuongut/openapi2jsonschema/openapi2jsonschema:latest
	docker push docker.pkg.github.com/nholuongut/openapi2jsonschema/openapi2jsonschema:latest

venv:
	python3 -m venv venv/
	source venv/bin/activate

.PHONY: pip-install
pip-install: venv
	pip install -r requirements.txt .

.PHONY: pip-freeze
pip-freeze:
	pip freeze > requirements.txt

.PHONY: run
run: pip-install
	python openapi2jsonschema/command.py https://raw.githubusercontent.com/kubernetes/kubernetes/master/api/openapi-spec/swagger.json