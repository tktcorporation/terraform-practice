env=test

clean:
	rm -rf ./.terraform

init:
	cd envs/$(env) && docker-compose run --rm tf init

plan:
	cd envs/$(env) && docker-compose run --rm tf plan -var-file=$(env).tfvars

apply:
	cd envs/$(env) && docker-compose run --rm tf apply -var-file=$(env).tfvars

show:
	cd envs/$(env) && docker-compose run --rm show

deploy: init plan apply show

destroy:
	cd envs/$(env) && docker-compose run --rm tf destroy -var-file=$(env).tfvars
