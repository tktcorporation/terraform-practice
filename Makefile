env=test

clean:
	rm -rf ./.terraform

init:
	terraform init

plan:
	terraform plan -var-file=$(env).tfvars

apply:
	terraform apply -var-file=$(env).tfvars

show:
	terraform show

deploy: init plan apply show

destroy:
	terraform destroy
