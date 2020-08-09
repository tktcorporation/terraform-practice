env=test

clean:
	rm -rf ./.terraform

init:
	docker-compose run --rm tf init envs/$(env)

plan:
	docker-compose run --rm tf plan -var-file=./envs/$(env).tfvars envs/$(env)

apply:
	docker-compose run --rm tf apply -var-file=./envs/$(env).tfvars envs/$(env)

show:
	docker-compose run --rm tf show

deploy: init plan apply show

destroy:
	docker-compose run --rm tf destroy -var-file=./envs/$(env).tfvars envs/$(env)
