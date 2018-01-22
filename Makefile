build:
	GOOS=linux go build -o _main
	zip main.zip _main

.PHONY: build

lambda-create:
	aws lambda create-function \
		--function-name planetbot1 \
		--runtime go1.x \
		--handler _main \
		--zip-file fileb://main.zip \
		--role arn:aws:iam::097545936362:role/service-role/lambda

.PHONY: lambda-create

lambda-upload:
	aws lambda update-function-code \
		--function-name planetbot1 \
		--zip-file fileb://main.zip

.PHONY: lambda-upload

lambda-invoke:
	touch /tmp/output.txt; \
	aws lambda invoke \
		--function-name planetbot1 \
		/tmp/output.txt; \
	cat /tmp/output.txt

.PHONY: lambda-invoke

update:
	make build
	make lambda-upload
	make lambda-invoke

.PHONY: update

all: update
