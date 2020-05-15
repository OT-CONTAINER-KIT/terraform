build:
	docker build -t opstree/terraform -f Dockerfile .
init:
	docker run --rm -v $(pwd):/workdir -t opstree/terraform init
plan:
	docker run --rm -v $(pwd):/workdir -t opstree/terraform plan
apply:
	docker run --rm -v $(pwd):/workdir -t opstree/terraform apply