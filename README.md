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
```shell
alias tf="docker run --rm -v $(pwd):/WORKDIR -t opstree/terraform"
```
##### init Terraform code Base
```shell
tf init
```
##### plan terraform 
```shell
tf plan
```
##### apply terraform 
```shell
tf apply
```
