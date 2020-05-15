<p align="left">
  <img src="./img/opstree_terraform_lint.png">
</p>

# Ot-Container-Kit (Terraform)

I am a repo which have a production based Terraform docker image codebase.

## Pre-requisites

Here are the list of pre-requisites which is required for development and setup purpose.

- **Docker Engine**

That's it

## Building Image

#### Docker Image

```shell
docker build -t opstree/terraform .
```

#### Run on Terraform code base

##### init Terraform code Base
```shell
docker run --rm -v $(pwd):/WORKDIR -t opstree/terraform init
```
##### plan terraform 
```shell
docker run --rm -v $(pwd):/WORKDIR -t opstree/terraform plan
```
##### apply terraform 
```shell
docker run --rm -v $(pwd):/WORKDIR -t opstree/terraform apply 
```
